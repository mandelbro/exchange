require "test_helper"

feature "Deleting a Question" do
  scenario "click the delete button on the question page" do
    # Given I'm a logged in user and visit an existing question page
    sign_in
    visit question_path(questions(:tie))

    # When I click the delete link
    click_on "Delete"

    # The form should submit successfully and the changes should be on the show page
    page.text.must_include "Question was successfully deleted"
    page.find('.questions-list').text.wont_include questions(:tie).question
  end
end
