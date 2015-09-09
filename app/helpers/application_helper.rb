module ApplicationHelper
  def full_title(page_title)
    base_title = I18n.t('layouts.header.project_name')
    slogan = I18n.t('layouts.header.slogan')
    if page_title.empty?
      "#{base_title} - #{slogan}"
    else
      "#{page_title} | #{base_title} - #{slogan}"
    end
  end

  def active_page(path)
    current_page?(path) ? 'active' : 'none'
  end
end
