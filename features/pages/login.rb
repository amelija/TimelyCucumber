require 'rspec'
include RSpec::Matchers

class Login
  attr_accessor :username, :password, :login_btn
  def initialize(browser)
    @browser = browser
    @username = @browser.element(id: 'user_email')
    @password = @browser.element(id: 'user_password')
    @login_btn = @browser.element(xpath: "//input[@class='btn btn-default btn-success']")
  end

  def wait_for_page_to_load
    sleep(5)
    wait = Selenium::WebDriver::Wait.new(timeout: 60)
    wait.until { @browser.execute_script('return document.readyState').to_s == 'complete' } && wait.until { @browser.execute_script('return window.openHTTPs').to_i.zero? }
  end

  def open_url
    @browser.goto("http://app.timelyapp.local:3002/login")
  end

  def enter_email(email)
    @username.send_keys(email)
  end

  def enter_password(password)
    @password.send_keys(password)
  end

  def click_login_btn
    @login_btn.click
    @week = WeekPage.new(@browser)
  end
end