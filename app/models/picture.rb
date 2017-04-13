class Picture < ApplicationRecord

  def self.newest_first
    Picture.order(created_at: :DESC)
  end

  def self.most_recent_five
    Picture.newest_first.limit(5)
  end

  def self.created_before(time)
    Picture.where("created_at < ?", time)
  end

  validates :title, :artist, :url, presence: true
  validates :title, length: { in: 3..20 }
  validates :url, uniqueness: true


end
