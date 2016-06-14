require "rails_helper"

feature "User views todos" do
  scenario "successfully" do
    Todo.create!(title: "Buy eggs", owner_email: "person@example.com")
    Todo.create!(title: "Buy corn", owner_email: "person@example.com")
    Todo.create!(title: "Buy milk", owner_email: "someone+else@example.com")

    sign_in_as "person@example.com"

    expect(page).to have_css "li:nth-of-type(1)", text: "Buy eggs"
    expect(page).to have_css "li:nth-of-type(2)", text: "Buy corn"

    expect(page).to have_incomplete_todo "Buy eggs"
    expect(page).to have_content "person@example.com"
    expect(page).not_to have_incomplete_todo "Buy milk"
  end
end
