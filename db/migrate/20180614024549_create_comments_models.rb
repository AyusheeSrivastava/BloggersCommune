class CreateCommentsModels < ActiveRecord::Migration[5.0]
  def change
    create_table :comments_models do |t|
      t.string :description
      t.integer :blog_id
      t.integer :created_by
      t.integer :updated_by
      t.integer :lock_version

      t.timestamps
    end
  end
end
