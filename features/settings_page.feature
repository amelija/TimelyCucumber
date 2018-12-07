Feature: Scenarios for the setting page

  @smoke
  Scenario Outline: I navigate to settings page
    Given I open Timely app
    When I enter "<email>" and "<password>" and login
    And I click Settings button
    Then I navigate to the settings page
    When I enter a "<new_site_name>" into the site name field
    And I refresh the page
    Then Site name remains changed
    When I change starting week day to Monday
    And I change currency to Serbian dinar
    And I click on Update settings
    Then Starting week day should be Monday
    And Currency on the Hours page should be Serbian dinar



    Examples:
      | email                         | password | new_site_name |
      | marija+teststaging1@memory.ai | password | marija |

