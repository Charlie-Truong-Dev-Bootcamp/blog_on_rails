class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :tag_associations
  has_many :posts, :through => :tag_associations
  before_destroy :check_for_posts

  def self.add_tags(tags)
    tags = tags.split(',').map{|tag| tag.strip.downcase}
    tags.each{|tag| create(name: tag) if where(name: tag).empty?}
    where(name: tags)
  end

  def check_for_posts
    posts.count > 0 ? false: true
  end
end
