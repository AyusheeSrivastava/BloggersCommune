class CommentsModel < ApplicationRecord
	belongs_to :blog_model, :foreign_key => "blog_id"
	belongs_to :user_model , :foreign_key => "created_by"
end
