module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_title
  end

  def set_title
    @page_title = "Devcamp Portfolio | My Portfolio website"
    @seo_keywords = "Todd T portfolio"
  end
end