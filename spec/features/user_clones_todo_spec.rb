require "rails_helper"

feature "User clones todo" do
  scenario "successfully" do
    sign_in_as "person@example.com"

    create_todo_titled "Buy eggs"

    clone_todo "Buy eggs"

    expect(page).to have_css "li", text: "Buy eggs", count: 2
  end
end
