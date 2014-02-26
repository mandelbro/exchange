require "test_helper"

feature "Editing a Question" do
  scenario "submit form data to edit an existing question" do
    # Given I visit the homepage
    visit root_path

    # When I click on a link from the main list
    page.find(".questions-list").click_on questions(:tie).question

    # The form should submit successfully and the changes should be on the show page
    page.find("h1").text.must_include questions(:tie).question
  end
end
