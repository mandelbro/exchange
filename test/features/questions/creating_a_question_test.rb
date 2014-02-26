require "test_helper"

feature "Creating a Question" do
  scenario "submit form data to create a new question" do
    # Given I'm on the new question page
    visit root_path
    page.find(".sidebar").click_on "Ask New Question"
    fill_in "Question", with: "What sound does the fox make?"

    # When fill out the form and click submit
    click_on "Save Question"

    # Then a new question should be created and displayed
    page.text.must_include "Question was successfully created"
    page.text.must_include "What sound does the fox make?"
  end
end
