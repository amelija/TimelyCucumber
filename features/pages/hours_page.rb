require 'rspec'
require 'watir'
include RSpec::Matchers

class Hours
  attr_accessor :currency
  def initialize(browser)
    @browser = browser
    @currency = @browser.element(xpath: "//div[@class='DayHeader__dayLaneContainer___1901I']/h2/small/span/span[1]")

  end



end