require "test_helper"

feature "Answering a Question" do
  scenario "submit form data to add answer to an existing question" do
    # Given I visit an existing question page
    visit question_path(questions(:tie))
    page.find('.sidebar').click_on "Update Answer"

    # When I click the edit link and submit changes to the form
    fill_in "Answer", with: "Updated answer test."
    click_on "Save Answer"

    # The form should submit successfully and the changes should be on the show page
    page.text.must_include "Question was successfully updated"
    page.text.must_include "Updated answer test."
  end
end
