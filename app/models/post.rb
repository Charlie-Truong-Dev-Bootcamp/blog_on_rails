class Post < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  has_many :tag_associations
  has_many :tags, :through => :tag_associations
end
