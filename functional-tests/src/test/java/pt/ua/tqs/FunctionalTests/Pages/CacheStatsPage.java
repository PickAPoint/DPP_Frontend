package pt.ua.tqs.FunctionalTests.Pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

public class CacheStatsPage {
    private WebDriver driver;

    public CacheStatsPage(WebDriver driver, String baseUrl) {
        this.driver = driver;
        driver.get(baseUrl + "cacheStats/");
        PageFactory.initElements(driver, this);
    }


    public boolean isGraphicDisplayed() {
        return driver.getPageSource().contains("svg");
    }

    public boolean isTextLineDisplayed(String arg0) {
        return driver.getPageSource().contains(arg0);
    }
}
