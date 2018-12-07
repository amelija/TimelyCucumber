require 'rspec'
include RSpec::Matchers

class ProfileSettings
  attr_accessor :profile_btn, :user_email, :update_btn, :success_text
  def initialize(browser)
    @browser = browser
    #@setting_btn = @browser.element(xpath: "//div[@class='hint--rounded hint--right']/a[@class='NavbarButton__button___2LaIp']")
    @profile_btn = @browser.element(xpath: "//ul[@class='nav nav-tabs nav-tabs-settings no_top_padding']/li[2]")
    @user_email = @browser.element(id: "user_email")
    @update_btn = @browser.element(xpath: "//input[@value='Update settings']")
    @success_text = @browser.element(xpath: "//div[@class='alert alert-success']")
  end

  def title
    @browser.title
  end

  def open_profile_page
    @profile_btn.click
  end

  def enter_email(email)
    @user_email.send_keys(email)
  end

  def click_update_button
    @update_btn.click
  end

  def success
    return @success_text.text
  end

  def open_url
    @browser.goto("http://app.timelyapp.local:3002/1/settings/edit")
  end

end