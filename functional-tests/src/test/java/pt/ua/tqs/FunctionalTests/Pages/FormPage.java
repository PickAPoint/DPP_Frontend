package pt.ua.tqs.FunctionalTests.Pages;

public interface FormPage {
    void selectCity(String city);
    void clickGetAirQualityBtn();
    boolean isTableDisplayed();
    boolean isMessageDisplayed();
}
