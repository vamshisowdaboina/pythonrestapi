#Create the docker container, running a proxy on port 12345
docker run --rm --name zap_selenium \
  --network="host" \
  -v $(pwd)/start.py:/zap/start.py:rw \
  -v $(pwd)/end.py:/zap/end.py:rw \
  -v $(pwd)/output:/out:rw \
  -d \
  owasp/zap2docker-weekly \
  zap-x.sh \
    -daemon \
    -port 12345 \
    -host 0.0.0.0 \
    -config api.disablekey=true \
    -config api.addrs.addr.name=.* \
    -config api.addrs.addr.regex=true \
    -config spider.maxDuration=2 \
    -config globalexcludeurl.url_list.url.regex='^http:\/\/localhost:9080\/.*$' \
    -addonupdate \
    -addoninstall pscanrulesBeta

#Setup ZAP for e2e tests
docker exec zap_selenium /zap/start.py

#Run e2e tests
pushd ../medium-java-example-exams/medium-java-exams-e2e/
../mvnw verify -DargLine="-Dzap_proxy=12345"
popd

#Finish e2e tests
docker exec zap_selenium /zap/end.py
