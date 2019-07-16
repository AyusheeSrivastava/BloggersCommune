class UserModel < ApplicationRecord
	has_many :blog_model, :foreign_key => "created_by"
	has_many :comments_model, :foreign_key => "created_by"
end
