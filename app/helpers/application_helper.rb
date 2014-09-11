module ApplicationHelper
  def page_title(title)
    title.empty? ? 'Airlift' : title
  end
end
