require "rails_helper"

feature "Smoke test" do
  scenario "the homepage works" do
    visit "/"

    expect(page).to have_page_header
  end

  def have_page_header
    have_css "h1", text: "Todos"
  end
end
