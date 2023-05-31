package pt.ua.tqs.FunctionalTests.Pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class HistoricalAirQualityPage implements FormPage {
    private WebDriver driver;

    @FindBy(id = "city")
    private WebElement city;

    @FindBy(id = "start-date")
    private WebElement startDate;

    @FindBy(id = "end-date")
    private WebElement endDate;

    @FindBy(css = "button[type='button']")
    private WebElement getAirQualityBtn;

    public HistoricalAirQualityPage(WebDriver driver, String baseUrl) {
        this.driver = driver;
        driver.get(baseUrl + "historical/");
        PageFactory.initElements(driver, this);
    }

    public void selectCity(String city) {
        this.city.sendKeys(city);
    }

    public void selectStartDate(String startDate) {
        this.startDate.sendKeys(startDate);
    }

    public void selectEndDate(String endDate) {
        this.endDate.sendKeys(endDate);
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
