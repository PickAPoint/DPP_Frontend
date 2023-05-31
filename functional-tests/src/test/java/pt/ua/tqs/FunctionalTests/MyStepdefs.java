package pt.ua.tqs.FunctionalTests;

import io.cucumber.java.en.When;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.Given;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.edge.EdgeOptions;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxOptions;
import pt.ua.tqs.FunctionalTests.Pages.*;
import org.openqa.selenium.JavascriptExecutor;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class MyStepdefs {
    private WebDriver driver;
    private static String BASE_URL = "http://localhost:5173/#/";
    JavascriptExecutor js;

    @Given("I am on the {string} website")
    public void enterPage(String url){
        FirefoxOptions options = new FirefoxOptions();
        options.addArguments("--remote-allow-origins=*");
        driver = new FirefoxDriver(options);

        js = (JavascriptExecutor) driver;

//        switch (url) {
//            case "Current" -> formPage = new CurrentAirQualityPage(driver, BASE_URL);
//            case "Forecast" -> formPage = new DailyAirQualityForecastPage(driver, BASE_URL);
//            case "Historical" -> formPage = new HistoricalAirQualityPage(driver, BASE_URL);
//            case "Cache" -> cacheStatsPage = new CacheStatsPage(driver, BASE_URL);
//        }
    }



    @When("I navigate to the {string} page")
    public void iNavigateToThePage(String arg0) {
        EdgeOptions options = new EdgeOptions();
//        options.addArguments("--headless"); // remove to see the browser
        options.addArguments("--remote-allow-origins=*");
        driver = new EdgeDriver(options);
        switch (arg0) {
            case "Current" -> formPage = new CurrentAirQualityPage(driver, BASE_URL);
            case "Forecast" -> formPage = new DailyAirQualityForecastPage(driver, BASE_URL);
            case "Historical" -> formPage = new HistoricalAirQualityPage(driver, BASE_URL);
            case "Cache" -> cacheStatsPage = new CacheStatsPage(driver, BASE_URL);
        }
    }

    @And("I select {string} as the target city")
    public void iSelectAsTheTargetCity(String arg0) {
        formPage.selectCity(arg0);
        System.out.println(formPage.isTableDisplayed());
    }

    @And("I click on the retrieve button")
    public void iClickOnTheGetRealTimeDataButton() {
        formPage.clickGetAirQualityBtn();
    }

    @Then("I should see a table with the results")
    public void iShouldSeeATableWithTheResults() {
        assertTrue(formPage.isTableDisplayed());
    }

    @Then("I should see a message {string}")
    public void iShouldSeeAMessage(String arg0) {
        assertTrue(formPage.isMessageDisplayed());
    }

    @And("I select {string} as the start date")
    public void iSelectAsTheStartDate(String arg0) {
        HistoricalAirQualityPage historicalAirQualityPage = (HistoricalAirQualityPage) formPage;
        historicalAirQualityPage.selectStartDate(arg0);
    }

    @And("I select {string} as the end date")
    public void iSelectAsTheEndDate(String arg0) {
        HistoricalAirQualityPage historicalAirQualityPage = (HistoricalAirQualityPage) formPage;
        historicalAirQualityPage.selectEndDate(arg0);
    }

    @Then("I should see a graphic")
    public void iShouldSeeAGraphic() {
        assertTrue(cacheStatsPage.isGraphicDisplayed());
    }

    @And("I should see a text line with {string}")
    public void iShouldSeeATextLineWith(String arg0) {
        assertTrue(cacheStatsPage.isTextLineDisplayed(arg0));
    }
}
