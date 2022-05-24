# charset: UTF-8

@JIRA-001
Feature: Simple example
  Scenario: Simple user post
    Given the user wants to create a new user
    And the user fills field "login" with value equal "biancaoliveira"
    And the user fills field "full_name" with value equal "Bianca Oliveira"
    And the user fills field "age" with value equal "31"
    And the user fills field "email" with value equal "bianca.sousa18@gmail.com"
    When the user saves new user
    Then the user should see "save with success" message


  Scenario: Simple user get
    Given the user wants to create a new user
    And the user fills field "login" with value equal "biancaoliveira"
    And the user fills field "full_name" with value equal "Bianca Oliveira"
    And the user fills field "age" with value equal "31"
    And the user fills field "email" with value equal "bianca.sousa18@gmail.com"
    And the user saves new user
    When the user gets the same user
    Then the user should see "success" message
    And the user should see field "login" with value "biancaoliveira"
    And the user should see field "full_name" with value "Bianca Oliveira"
    And the user should see field "age" with value "31"
    And the user should see field "email" with value "bianca.sousa18@gmail.com"


  Scenario: Simple user put
    Given the user wants to create a new user
    And the user fills field "login" with value equal "biancaoliveira"
    And the user fills field "full_name" with value equal "Bianca Oliveira"
    And the user fills field "age" with value equal "31"
    And the user fills field "email" with value equal "bianca.sousa18@gmail.com"
    And the user saves new user
    When the user fills field "login" with value equal "bianca.oliveira18"
    And the user puts the same user
    And the user gets the same user
    Then the user should see "success" message
    And the user should see field "login" with value "bianca.oliveira18"
    And the user should see field "full_name" with value "Bianca Oliveira"
    And the user should see field "age" with value "31"
    And the user should see field "email" with value "bianca.sousa18@gmail.com"


  Scenario: Simple user delete
    Given the user wants to create a new user
    And the user fills field "login" with value equal "biancaoliveira"
    And the user fills field "full_name" with value equal "Bianca Oliveira"
    And the user fills field "age" with value equal "31"
    And the user fills field "email" with value equal "bianca.sousa18@gmail.com"
    And the user saves new user
    When the user deletes the same user
    Then the user should see "not content" message

    When the user gets the same user
    Then the user should see "not found" message


  Scenario: Simple user contract
    Given the user wants to create a new user
    And the user fills field "login" with value equal "biancaoliveira"
    And the user fills field "full_name" with value equal "Bianca Oliveira"
    And the user fills field "age" with value equal "31"
    And the user fills field "email" with value equal "bianca.sousa18@gmail.com"
    And the user saves new user
    When the user gets the same user
    Then the user should see your schema

  Scenario: Simple builder environment data
    Given the user wants to create a new user
    And the user fills all fields
    And the user saves new user
    When the user gets the same user
    Then the user should see "success" message
    And the user should see field "login" with value "dadosdev"
    And the user should see field "full_name" with value "Dados Dev"
    And the user should see field "age" with value "31"
    And the user should see field "email" with value "dados.dev@gft.com"