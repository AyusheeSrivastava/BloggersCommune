class CommentsControllerController < ApplicationController
  def users_comment
  	@object=CommentsModel.find_by_sql("select * from comments_models where lock_version<>-1 and blog_id=#{params[:id]}")
  	@blog_id=params[:id]
  	render :partial=>"comments_controller/CommentsListing.js.erb"

  end
  def create_comment
  	@object=CommentsModel.new
  	@object.description=params[:description]
  	@object.blog_id=params[:blog_id]
  	@object.created_by=session[:current_user]
  	@object.updated_by=session[:current_user]
  	@object.save
  	params[:id]=params[:blog_id]
  	users_comment
  end

end
