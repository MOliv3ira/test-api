# charset: UTF-8

@JIRA-002
Feature: Simple example two
  Scenario: Simple user post one
    Given the user wants to create a new user
    And the user fills field "login" with value equal "marcusoliveira"
    And the user fills field "full_name" with value equal "Marcus Oliveira"
    And the user fills field "age" with value equal "29"
    And the user fills field "email" with value equal "msdv@gft.com"
    When the user saves new user
    Then the user should see "save with success" message

  Scenario: Simple user get two
    Given the user wants to create a new user
    And the user fills field "login" with value equal "marcusoliveira"
    And the user fills field "full_name" with value equal "Marcus Oliveira"
    And the user fills field "age" with value equal "29"
    And the user fills field "email" with value equal "msdv@gft.com"
    And the user saves new user
    When the user gets the same user
    Then the user should see "success" message
    And the user should see field "login" with value "marcusoliveira"
    And the user should see field "full_name" with value "Marcus Oliveira"
    And the user should see field "age" with value "29"
    And the user should see field "email" with value "msdv@gft.com"

  Scenario: Simple user put three
    Given the user wants to create a new user
    And the user fills field "login" with value equal "marcusoliveira"
    And the user fills field "full_name" with value equal "Marcus Oliveira"
    And the user fills field "age" with value equal "29"
    And the user fills field "email" with value equal "msdv@gft.com"
    And the user saves new user
    When the user fills field "login" with value equal "msdv.oliveira"
    And the user puts the same user
    And the user gets the same user
    Then the user should see "success" message
    And the user should see field "login" with value "msdv.oliveira"
    And the user should see field "full_name" with value "Marcus Oliveira"
    And the user should see field "age" with value "29"
    And the user should see field "email" with value "msdv@gft.com"

  Scenario: Simple user delete four
    Given the user wants to create a new user
    And the user fills field "login" with value equal "marcusoliveira"
    And the user fills field "full_name" with value equal "Marcus Oliveira"
    And the user fills field "age" with value equal "29"
    And the user fills field "email" with value equal "msdv@gft.com"
    And the user saves new user
    When the user deletes the same user
    Then the user should see "not content" message

    When the user gets the same user
    Then the user should see "not found" message

  Scenario: Simple user contract
    Given the user wants to create a new user
    And the user fills field "login" with value equal "marcusoliveira"
    And the user fills field "full_name" with value equal "Marcus Oliveira"
    And the user fills field "age" with value equal "29"
    And the user fills field "email" with value equal "msdv@gft.com"
    And the user saves new user
    When the user gets the same user
    Then the user should see your schema

  Scenario: Simple builder environment data
    Given the user wants to create a new user
    And the user fills all fields
    And the user saves new user
    When the user gets the same user
    Then the user should see "success" message
    And the user should see field "login" with value "marcusoliveira"
    And the user should see field "full_name" with value "Marcus Oliveira"
    And the user should see field "age" with value "29"
    And the user should see field "email" with value "msdv@gft.com"


