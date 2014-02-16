class Post < ActiveRecord::Base
  attr_accessible :title, :body
  belongs_to :user
  has_many :tag_associations
  has_many :tags, :through => :tag_associations
  validates :body, :presence => true
  validates :title, :presence => true

  def create_date_display
    created_at == nil ? nil : created_at.strftime("%m-%d-%Y")
  end

  def tags_edit
    tags.map{|tag|tag.name}.join(',')
  end
end
