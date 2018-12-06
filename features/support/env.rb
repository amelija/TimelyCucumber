require 'allure-cucumber'
require 'rubygems'
require 'rspec'
require 'watir'
require 'minitest/autorun'

include Selenium

include AllureCucumber::DSL

AllureCucumber.configure do |c|
  c.output_dir = './allure'
end

#After do |scenario|
 # if scenario.failed?
  #  screenshot_file = "screenshot-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
   # @browser.driver.save_screenshot(screenshot_file)
    #attach_file('failed step', screenshot_file)
  #end
 # @browser.close
 # @browser.quit
#end