require "rails_helper"

feature "User creates todo" do
  scenario "successfully" do
    sign_in_as "person@example.com"

    create_todo_titled "Buy eggs"

    expect(page).to have_incomplete_todo "Buy eggs"
  end
end
