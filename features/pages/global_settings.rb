require 'rspec'
require 'watir'
include RSpec::Matchers

class GlobalSettings
  attr_accessor :site_name, :week_starts_dropdown, :currency_dropdown, :week_capacity, :update_settings_btn, :update_alert
  def initialize(browser)
    @browser = browser
    @site_name = @browser.element(id: "account_company_name")
    @week_starts_dropdown = @browser.select(id: "account_start_of_week")
    @currency_dropdown = @browser.select(id: "account_currency_code")
    @week_capacity = @browser.element(id: "account_weekly_user_capacity")
    @update_settings_btn = @browser.element(xpath: "//input[@value='Update settings']")
    @update_alert = @browser.element(xpath: "//body/div[1]/div[2]/div[2]/div[1]")

  end

  def wait_for_page_to_load
    sleep(5)
    wait = Selenium::WebDriver::Wait.new(timeout: 60)
    wait.until do
      @browser.execute_script('return document.readyState').to_s == 'complete'
    end && wait.until do
      @browser.execute_script('return window.openHTTPs').to_i.zero?
    end
  end

  def change_starting_week_day
    @week_starts_dropdown.select('1')
  end

  def change_currency
    @currency_dropdown.select('rsd')
  end

  def get_title
    @browser.title
  end

  def change_site_name(site_name)
    @site_name.send_keys(site_name)
    #@site_name.to_subtype.set("Watir")
  end

  def refresh_page
    @browser.refresh
  end
  def clear_site_name
    @site_name.to_subtype.clear
  end

  def open_global_settings
    @browser.goto("http://app.timelyapp.local:3002/1/settings/edit")
  end

  def goto_hours_page
    @browser.goto("http://app.timelyapp.local:3002/1/calendar/day")
    @hours = Hours.new(@browser)
  end

  def click_update_button
    @update_settings_btn.click
  end

  def open_url
    @browser.goto("http://app.timelyapp.local:3002/1/settings/edit")
  end

end