require "rails_helper"

feature "User completes todo" do
  scenario "successfully" do
    # sign in
    sign_in_as "person@example.com"

    # create a todo
    create_todo_titled "Buy eggs"

    # mark the todo as complete
    mark_complete "Buy eggs"

    # ensure todo shows up in the "complete" list
    expect(page).to have_completed_todo "Buy eggs"
    expect(page).not_to have_incomplete_todo "Buy eggs"
  end
end
