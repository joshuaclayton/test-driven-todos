module Features
  def have_completed_todo(title)
    have_css "ul.completed li", text: title
  end

  def have_incomplete_todo(title)
    have_css "ul.incomplete li", text: title
  end

  def create_todo_titled(title)
    click_on "Create a new todo"
    fill_in "Title", with: title
    click_on "Create Todo"
  end

  def mark_complete(title)
    within "li:contains('#{title}')" do
      click_on "Mark complete"
    end
  end

  def mark_incomplete(title)
    within "li:contains('#{title}')" do
      click_on "Mark incomplete"
    end
  end
end
