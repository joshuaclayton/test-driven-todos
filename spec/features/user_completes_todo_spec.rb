require "rails_helper"

feature "User completes todo" do
  scenario "successfully" do
    # sign in
    sign_in_as "person@example.com"

    # create a todo
    create_todo_titled "Buy eggs"
    create_todo_titled "Buy corn"

    # mark the todo as complete
    mark_complete "Buy eggs"
    mark_complete "Buy corn"

    # ensure todo shows up in the "complete" list
    expect(page).to have_completed_todo "Buy eggs"
    expect(page).not_to have_incomplete_todo "Buy eggs"

    expect(page).to have_css "ul.completed li:nth-of-type(1)", text: "Buy corn"
    expect(page).to have_css "ul.completed li:nth-of-type(2)", text: "Buy eggs"
  end
end
