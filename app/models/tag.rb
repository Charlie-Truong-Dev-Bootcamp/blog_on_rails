class Tag < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :tag_associations
  has_many :posts, :through => :tag_associations
end
