class CreateUserModels < ActiveRecord::Migration[5.0]
  def change
    create_table :user_models do |t|
      t.string :firstname
      t.string :secondname
      t.string :password
      t.datetime :dob
      t.string :email
      t.string :phoneNo

      t.timestamps
    end
  end
end
