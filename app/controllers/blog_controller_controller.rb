class BlogControllerController < ApplicationController
  def create_blog
  	render :partial=> "blog_controller/BlogCreation.js.erb"
  end
def create_user_blog
if !params[:title].nil? && !params[:description].nil?
if !params[:title].empty? && !params[:description].empty?
	@object=BlogModel.new
	@object.title=params[:title]
	@object.description=params[:description]
	@object.created_by=session[:current_user]
	@object.locked_version=0
	@object.save
	@success='true'
	@msg="User's blog created successfully.."
  #yahan mein view wala method
  users_blog





	else
		@success='false'
	@msg="kindly fill both title and description"
  render :partial=>"blog_controller/BlogCreationSuccessPage.js.erb"
  #yahan render
end
else
	@success='false'
	@msg="kindly fill both title and description"
  render :partial=>"blog_controller/BlogCreationSuccessPage.js.erb"
  #yahan render
end

#iss render ko hi upar chipka ke isse hata do

end 

def users_blog
	logger.debug"Ayusheeeeeee#{session[:current_user].inspect}"
  params[:page]||=1
  @current_page=params[:page]
  @object=BlogModel.paginate_by_sql("select * from blog_models where locked_version<>-1 and created_by=#{session[:current_user]}",:page=>@current_page,:per_page=>5)
  total_count=BlogModel.find_by_sql("select count(*) as count from blog_models where locked_version<>-1 and created_by=#{session[:current_user]}").last
  @total_data_count=total_count.count
	#@object=BlogModel.where("created_by=? and locked_version<>-1 ", session[:current_user])
	logger.debug"Ayuuuuuuuu#{@object.inspect}"
	render :partial=>"blog_controller/UserBlogViewer.js.erb"
end

  def edit_blog
  	@object=BlogModel.find(params[:id])
  	render :partial=>"blog_controller/blogEditForm.js.erb"
  end

  def view_blog
    params[:page]||=1
  @current_page=params[:page]
  @object=BlogModel.paginate_by_sql("select * from blog_models where locked_version<>-1 ",:page=>@current_page,:per_page=>5)
  total_count=BlogModel.find_by_sql("select count(*) as count from blog_models where locked_version<>-1 ").last
  @total_data_count=total_count.count
  	#@object=BlogModel.where("locked_version<>-1")

  	render :partial=>"blog_controller/BlogViewer.js.erb"

  end
  def delete_your_blog
    @object=BlogModel.find(params[:id])
    @object.locked_version=-1
    @object.save
    @success='true'
    @msg='deleted sucessfully'
    users_blog

  end

  def edit_user_blog
  	@object=BlogModel.find(params[:id])
  	@object.title=params[:title]
  	@object.description=params[:description]
  	@object.save
  	@success='true'
    @msg='updated sucessfully'
    users_blog
  	
  	

  end
  def logout_user
    session[:current_user]=nil
    @msg='logged out successfully'
    @success='true'
    render :partial=>"blog_controller/logoutPage.js.erb"
  end

  def backToHome
    
    @object=UserModel.where("id=?", session[:current_user]).last
    render :partial=>"blog_controller/backPage.js.erb" 


  end
end
