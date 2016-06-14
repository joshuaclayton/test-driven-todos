module Features
  def have_todo(title)
    have_css "li", text: title
  end

  def create_todo_titled(title)
    click_on "Create a new todo"
    fill_in "Title", with: title
    click_on "Create Todo"
  end
end
