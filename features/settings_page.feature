Feature: Scenarios for the setting page

  @smoke
  Scenario Outline: I navigate to settings page
    Given I open Timely app
    When I enter "<email>" and "<password>" and login
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

 # Scenario Outline: Change the site name in the global settings
  #  Given I opened the Global settings page
  #  When I enter a "<new_site_name>" into the site name field
  #  And I refresh the page
  #  Then Site name remains changed

   # Examples:
    #  | new_site_name|
     # | marija       |

  #Scenario Outline: I change the email of the logged in user
   # Given I opened the Profile page in settings
    #When I enter the correct "<new_email>" into the email field
    #And I click on Update User button
    #Then Successfully updated profile should be displayed on the screen

  #Examples:
  #| new_email                    |
  #| marija+teststaging@memory.ai |

