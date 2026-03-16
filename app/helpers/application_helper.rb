module ApplicationHelper
  def page_title(title = nil)
    base = "BookNest"
    title.present? ? "#{title} | #{base}" : base
  end
end
