Given(/^I open Timely app$/) do
  @login = Login.new(@browser)
  @login.open_url
end
When(/^I enter \"(.*)\" and \"(.*)\" and login$/) do |email, password|
  @login.enter_email(email)
  @login.enter_password(password)
  @week = @login.click_login_btn
  expect(@browser.title).to eq("Week – Timely")
end
Then(/^I navigate to the settings page$/) do
  @settings_page = @week.click_settings
  expect(@browser.title).to eq("Settings")
end
When(/^I enter a \"(.*)\" into the site name field$/) do |new_site_name|
  @settings_page.clear_site_name
  @settings_page.change_site_name(new_site_name)
end
And(/^I refresh the page$/) do
  @settings_page.refresh_page
end
Then(/^Site name remains changed$/) do
  expect(@settings_page.site_name.to_subtype.value).to eq("marija")
end
When(/^I change starting week day to Monday$/) do
  @settings_page.change_starting_week_day
end
And(/^I change currency to Serbian dinar$/) do
  @settings_page.change_currency
end
And(/^I click on Update settings$/) do
  @settings_page.click_update_button
  expect(@settings_page.update_alert.text).to eq("Account updated successfully")
end
Then(/^Starting week day should be Monday$/) do
  expect(@settings_page.week_starts_dropdown.text).to eq('Monday')
end
And(/^Currency on the Hours page should be Serbian dinar$/) do
  @hours_page = @settings_page.goto_hours_page
  expect(@hours_page.currency.text).to eq("РСД")
  # puts @settings_page.week_starts_dropdow.to_subtype.value
end

=begin
Given(/^I opened the profile page in settings$/) do
  @settings_page = @week.click_settings
  #@setting_page = @week_page.click_settings
  #@settings_page.open_url

  expect(@browser.title).to eq("ProfileSettings")
  #@settings_page.open_profile_page
  #@settings_page.wait_for_page_to_load
end
When(/^I enter the correct \"(.*)\" into the email field$/) do |new_email|
  @settings_page.enter_email(new_email)
end
And(/^I click on Update user button$/) do
  @settings_page.click_update_button
end
Then(/^Successfully updated profile should be displayed on the screen$/) do
  #expect(@settings_page.success).to eql("Successfully updated profile")
  #puts "Successfully updated profile"
end
=end
