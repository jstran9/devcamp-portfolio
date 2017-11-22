module SetSocialMediaLinksConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_github_link
  end

  def set_github_link
    @todd_github_link = "https://github.com/ttran9"
  end

end