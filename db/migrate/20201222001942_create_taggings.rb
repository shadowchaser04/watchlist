class CreateTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :taggings do |t|
      t.belongs_to :movie, null: false, foreign_key: true
      t.belongs_to :tag, null: false, foreign_key: true
    end
  end
end
