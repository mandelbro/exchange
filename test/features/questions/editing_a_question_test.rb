require "test_helper"

feature "Editing a Question" do
  scenario "submit form data to edit an existing question" do
    # Given I visit an existing question page
    visit question_path(questions(:tie))
    page.find('.sidebar').click_on "Edit"

    # When I click the edit link and submit changes to the form
    fill_in "Question", with: "Edited question text"
    click_on "Save Question"

    # The form should submit successfully and the changes should be on the show page
    page.text.must_include "Question was successfully updated"
    page.text.must_include "Edited question text"
  end
end
