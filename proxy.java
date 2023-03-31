
FirefoxBinary firefoxBinary = new FirefoxBinary();
firefoxBinary.addCommandLineOptions("--headless");
firefoxBinary.addCommandLineOptions("--no-sandbox");
System.setProperty("webdriver.gecko.driver", "drivers/geckodriver-linux-64bit");
FirefoxOptions firefoxOptions = new FirefoxOptions();
firefoxOptions.setBinary(firefoxBinary);
firefoxOptions.addPreference("network.proxy.allow_hijacking_localhost", true);
firefoxOptions.setProxy(new Proxy()
        .setHttpProxy("localhost:" + ZAP_PROXY_PORT)
        .setSslProxy("localhost:" + ZAP_PROXY_PORT)
        .setNoProxy("*.mozilla.net,*.firefox.com"));
FirefoxDriver driver = new FirefoxDriver(firefoxOptions);
