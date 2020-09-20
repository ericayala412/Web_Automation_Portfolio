@chrome
Feature: Verify the functionality of the Angular To-Do site
  As a user of the Angular To-Do site,
  I want to use the to-do functionality
  So that I can document what needs to be done

  # This test allows you to enter different types of strings in the To-Do
  # via an example table.
  Scenario Outline: Add a to-do and confirm that it was added to the list
    Given the user goes to the Angular To-Do site
    When the user adds a To-Do list containing <item1>, <item2>, <item3>
    Then the To-Do list will contain <item1>, <item2>, <item3>

    Examples:
      | item1 | item2        | item3    |
      | Test  | Drink Coffee | Party    |
      | 123   | 456          | 789      |
      | テスト | コーヒーを飲む  | パーティー |

  Scenario Outline: Complete an entire To-Do list and confirm that it was completed
    Given the user goes to the Angular To-Do site
    When the user adds a To-Do list containing <item1>, <item2>, <item3>
    And the user completes the To-Do list
    Then the list will be confirmed to be completed

    Examples:
      | item1 | item2        | item3    |
      | Test  | Drink Coffee | Party    |
      | 123   | 456          | 789      |
      | テスト | コーヒーを飲む  | パーティー |

  Scenario Outline: Complete a single To-Do and confirm that it was completed
    Given the user goes to the Angular To-Do site
    When the user adds a To-Do list containing <item1>, <item2>, <item3>
    And the user completes <item3> from the list
    Then <item3> will be marked as complete in the list

    Examples:
      | item1 | item2        | item3    |
      | Test  | Drink Coffee | Party    |
      | 123   | 456          | 789      |
      | テスト | コーヒーを飲む  | パーティー |

  Scenario Outline: Delete a single to-do and confirm that it was removed from the list
    Given the user goes to the Angular To-Do site
    When the user adds a To-Do list containing <item1>, <item2>, <item3>
    And the user deletes <item2> from the list
    Then <item2> will not appear in the list

    Examples:
      | item1 | item2        | item3    |
      | Test  | Drink Coffee | Party    |
      | 123   | 456          | 789      |
      | テスト | コーヒーを飲む  | パーティー |