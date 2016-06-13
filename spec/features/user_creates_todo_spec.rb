require "rails_helper"

feature "User creates todo" do
  scenario "successfully" do
    visit root_path
    click_on "Create a new todo"
    fill_in "Title", with: "Buy eggs"
    click_on "Create Todo"

    expect(page).to have_css "li", text: "Buy eggs"
  end
end
