Feature: Merge an article to another article
  As a blog administrator
  So that the blog don't be a mess with many similar posts
  I want to be able to merge an article to another article

  Background:
    Given the blog is set up
    And the user "user_A" exist
    And the user "user_B" exist
    And I am logged into the admin panel as "user_A"
    And I am on the new article page
    And I fill in "article_title" with "Foobar_A"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum A"
    And I press "Publish"
    And I follow "Log out"
    And I am logged into the admin panel as "user_B"
    And I am on the new article page
    And I fill in "article_title" with "Foobar_B"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum B"
    And I press "Publish"
    And I follow "Log out"

  Scenario: Non-admin user can't merge articles
    Given I am logged into the admin panel as "user_A"
    And I go to edit article with title "Foobar_A"
    Then I should not see "Merge Articles"

  Scenario: Admin merge article aaa to article bbb
    Given I am logged into the admin panel
    And I go to edit article with title "Foobar_A"
    When I fill in "merge_with" with the id of "Foobar_B"
    And I press "Merge"
    Then article "Foobar_B" should be merged with article "Foobar_A"

    #When I am on the "Article 1" edit page
    #Given I am on "Foobar_A" edit page
    #When I fill in "merge_with" with "aaa"


    #Given I am on the new article page
    #When I fill in "article_title" with "Foobar"
    #And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    #And I press "Publish"
    #Then I should be on the admin content page
    #When I go to the home page
    #Then I should see "Foobar"
    #When I follow "Foobar"
    #Then I should see "Lorem Ipsum"