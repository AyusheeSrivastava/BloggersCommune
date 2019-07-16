class BlogModel < ApplicationRecord
	belongs_to :user_model , :foreign_key => "created_by"
	has_many :comments_model ,:foreign_key =>"blog_id"
end
