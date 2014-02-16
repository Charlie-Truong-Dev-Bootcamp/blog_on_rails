class CreateTagAssociations < ActiveRecord::Migration
  def change
    create_table :tag_associations do |t|
      t.belongs_to  :post
      t.belongs_to  :tag
      t.timestamps
    end

    add_index :tag_associations, :tag_id
    add_index :tag_associations, [:post_id, :tag_id]
  end
end
