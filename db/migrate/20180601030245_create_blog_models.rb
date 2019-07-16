class CreateBlogModels < ActiveRecord::Migration[5.0]
  def change
    create_table :blog_models do |t|
      t.string :title
      t.text :description
      t.integer :locked_version
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
