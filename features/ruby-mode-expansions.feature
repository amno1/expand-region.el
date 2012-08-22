Feature: html-mode expansions
  In order to quickly and precisely mark ruby code blocks
  As an Emacs user
  I want to expand to them

  Scenario: Mark ruby block
    Given I turn on ruby-mode
    And there is no region selected
    When I insert:
    """
    something do
      foo
    end
    """
    And I place the cursor after "something"
    And I press "C-@"
    And I press "C-@"
    Then the region should be:
    """
    something do
      foo
    end
    """

  Scenario: Mark ruby block from end
    Given I turn on ruby-mode
    And there is no region selected
    When I insert:
    """
    something do
      foo
    end
    """
    And I place the cursor after "end"
    And I press "C-@"
    And I press "C-@"
    Then the region should be:
    """
    something do
      foo
    end
    """

  Scenario: Mark ruby block from within
    Given I turn on ruby-mode
    And there is no region selected
    When I insert:
    """
    something do
      foo
    end
    """
    And I go to line "2"
    And I press "C-@"
    And I press "C-@"
    Then the region should be:
    """
    something do
      foo
    end
    """

  Scenario: Mark ruby block with using curly brackets
    Given I turn on ruby-mode
    And there is no region selected
    When I insert:
    """
    something {
      foo
    }
    """
    And I go to line "2"
    And I press "C-@"
    And I press "C-@"
    And I press "C-@"
    Then the region should be:
    """
    something {
      foo
    }
    """
