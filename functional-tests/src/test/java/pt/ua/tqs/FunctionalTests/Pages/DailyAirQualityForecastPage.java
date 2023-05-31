package pt.ua.tqs.FunctionalTests.Pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class DailyAirQualityForecastPage implements FormPage {
    private WebDriver driver;

    @FindBy(id = "city")
    private WebElement city;

    @FindBy(css = "button[type='button']")
    private WebElement getAirQualityBtn;

    public DailyAirQualityForecastPage(WebDriver driver, String baseUrl) {
        this.driver = driver;
        driver.get(baseUrl + "forecast/");
        PageFactory.initElements(driver, this);
    }

    public void selectCity(String city) {
        this.city.sendKeys(city);
    }

    public void clickGetAirQualityBtn() {
        getAirQualityBtn.click();
    }

    public boolean isTableDisplayed() {
        return driver.getPageSource().contains("table");
    }

    public boolean isMessageDisplayed() {
        return driver.getPageSource().contains("span");
    }
}
