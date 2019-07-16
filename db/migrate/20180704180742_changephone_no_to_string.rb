class ChangephoneNoToString < ActiveRecord::Migration[5.0]

  	def self.up
    change_column :user_models, :phoneNo, :string
  end

  def self.down
    change_column :user_models, :phoneNo, :integer
  end
end

