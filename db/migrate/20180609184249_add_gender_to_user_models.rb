class AddGenderToUserModels < ActiveRecord::Migration[5.0]
  def change
    add_column :user_models, :gender, :integer
  end
end
