require 'rubygems'
require 'rspec'
require 'watir'
require 'minitest/autorun'

include Selenium

Before() do
  args = ['--ignore-certificate-errors', '--disable-popup-blocking', '--disable-translate', '--start-maximized']
  browser = Watir::Browser.new(:chrome, options: { args: args })
  @browser = browser
end