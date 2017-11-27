class Blog < ApplicationRecord
  enum status: {draft: 0, published: 1}
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body

  belongs_to :topic, optional: true

  has_many :comments, dependent: :destroy

  def self.special_blogs
    all
  end

  def self.featured_blogs
    limit(2)
  end

  def self.get_most_recent_blogs showAllBlogs, params
    if showAllBlogs
      order("created_at DESC").page(params[:page]).per(5)
    else
      where("status = 1").order("created_at DESC").page(params[:page]).per(5)
    end
  end
end
