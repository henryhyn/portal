module ApplicationHelper
  def active_page(path)
    current_page?(path) ? 'active' : 'none'
  end
end
