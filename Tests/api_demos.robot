*** Settings ***
Library           AppiumLibrary


Resource      ../Resources/keywords.robot


*** Test Cases ***
Test hyperspace
    [Documentation]    Ouvrir l'application api_debug
    
    Given I Open api_debug
    When I go on hyperspace
    Then The result should be the expected result
 

# Ensuite view > chronomètre commencez le et changer le format, assurez vous que le format a changé mais que le chronomètre tourne encore

 Test Chrono
    [Documentation]    Ouvrir l'application api_debug
    
    Given I Open api_debug
    When I launch Chronometer
    And I change the format
    Then The chronometer should still be running


# Ensuite on scroll dans view pour atteindre "seek bar"
# mettez la à 88  

Test Seek bar
    [Documentation]    Ouvrir l'application api_debug
    
    Given I Open api_debug
    When I scroll to seek bar
    And I set seek bar to 88
    Then The seek bar should be at 88