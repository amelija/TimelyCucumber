require 'rspec'
include RSpec::Matchers

class WeekPage
  attr_accessor :title, :setting_btn
  def initialize(browser)
    @browser = browser
    @title = @browser.element(xpath: "/html/head/title")
    @setting_btn = @browser.element(xpath: "//div[@class='hint--rounded hint--right']/a[@class='NavbarButton__button___2LaIp']")
  end

  def wait_for_page_to_load
    sleep(5)
    wait = Selenium::WebDriver::Wait.new(timeout: 60)
    wait.until { @browser.execute_script('return document.readyState').to_s == 'complete' } && wait.until { @browser.execute_script('return window.openHTTPs').to_i.zero? }
  end

  def open_url
    @browser.goto("http://app.timelyapp.local:3002/1/calendar/week")
  end
  def click_settings
    @setting_btn.click
    @settings_page = GlobalSettings.new(@browser)
  end

end