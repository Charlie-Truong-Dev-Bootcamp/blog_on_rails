class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :tag_associations
  has_many :posts, :through => :tag_associations

  def self.add_tags(tags)
    tags = tags.split(',').map{|tag| tag.strip.downcase}
    tags.each{|tag| create(name: tag) if where(name: tag).empty?}
    where(name: tags)
  end

  def self.find_posts(tag)
    where(name: tag).first.posts.order("created_at DESC")
  end
end
