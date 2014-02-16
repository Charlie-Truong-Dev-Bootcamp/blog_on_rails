class TagAssociation < ActiveRecord::Base
  attr_accessible :post_id, :tag_id
  belongs_to :tag, :dependent => :destroy
  belongs_to :post
end
