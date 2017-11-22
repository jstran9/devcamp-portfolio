module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_title, :set_github_link
  end

  def set_title
    @page_title = "Devcamp Portfolio | My Portfolio website"
    @seo_keywords = "Todd T portfolio"
  end

  def set_github_link
    @todd_github_link = "https://github.com/ttran9"
  end
end