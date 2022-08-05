import time

from selenium.webdriver.common.by import By
from robot.api.deco import keyword
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from webdriver_manager.chrome import ChromeDriverManager


@keyword("Search Text in Google")
def test_open_google_url():
    driver = webdriver.Chrome(ChromeDriverManager().install())
    driver.get('https://www.google.com/')
    driver.maximize_window()
    title = "Google"
    assert title == driver.title

    search_text = "ISTQB"
    # search_box = driver.find_element_by_xpath("//input[@name='q']")
    search_box = driver.find_element(By.XPATH, "//input[@name='q']")
    search_box.send_keys(search_text)

    time.sleep(5)

    # Option 1 - To Submit the search
    # search_box.submit()
    # Option 2 - To Submit the search
    search_box.send_keys(Keys.ARROW_DOWN)
    search_box.send_keys(Keys.ARROW_UP)
    time.sleep(2)
    search_box.send_keys(Keys.RETURN)

    time.sleep(5)

    # Click on the LambdaTest HomePage Link
    title = "Certifying Software Testers Worldwide - ISTQB® International Software Testing Qualifications Board"
    lt_link = driver.find_element_by_xpath(
        "//h3[contains(text(),'Certifying Software Testers Worldwide - ISTQB® Int')]")
    lt_link.click()

    time.sleep(5)
    assert title == driver.titl
    time.sleep(2)
    driver.quit()

