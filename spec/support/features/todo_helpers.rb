module Features
  def have_todo(title)
    have_css "li", text: title
  end
end
