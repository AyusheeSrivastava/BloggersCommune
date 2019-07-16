class UserControllerController < ApplicationController
  def welcome_method
  	
  end

  def register_method
  	render :partial=> "user_controller/register.js.erb"
  end
  def login_method
  	render :partial=> "user_controller/login.js.erb"
  end
  def submit_registeration_form
      checkOFEmail=UserModel.find_by_sql("select count(*) as count  from user_models where email='#{params[:email]}'").last
      if checkOFEmail.count>0
        @msg='Email already Exist'
        @success='false'
        
    else    
    @object=UserModel.new
    logger.debug"helloooo#{!params[:name].nil? and !params[:name2].nil? and !params[:dob].nil? and !params[:phoneNo].nil? and !params[:email].nil? and !params[:psw].nil? and !params[:psw_repeat].nil? and !params[:gender].nil? }"
    logger.debug"hellloooooo222#{!params[:name].nil?}______#{!params[:name2].nil?}______#{!params[:dob].nil?}______#{!params[:phoneNo].nil?}______#{!params[:email].nil?}______#{!params[:psw].nil?}______#{!params[:psw_repeat].nil?}"
    if !params[:name].nil? and !params[:name2].nil? and !params[:dob].nil? and !params[:phoneNo].nil? and !params[:email].nil? and !params[:psw].nil? and !params[:psw_repeat].nil? and !params[:gender].nil?
      if !params[:name].empty? and !params[:name2].empty? and !params[:dob].empty? and !params[:phoneNo].empty? and !params[:email].empty? and !params[:psw].empty? and !params[:psw_repeat].empty?  and !params[:gender].empty?
      @object.firstname=params[:name]
      @object.secondname=params[:name2]
      @object.dob=params[:dob]
      @object.phoneNo=params[:phoneNo]
      @object.email=params[:email]
      @object.gender=params[:gender]
      
        @object.password=params[:psw]
        

      
      
        @object.save
        @msg='successfully registered'
        @success='true'
        
       else
        logger.debug"here111111"
        @msg='kindly fill the complete values  for creation of account'
        @success='false'
        
       end 
     
else
  logger.debug"here22222"
  @msg='kindly fill the complete values  for creation of account'
  @success='false'

end
  end
 render :partial=>"user_controller/SuccessfulSignUp.js.erb" 
end
def submit_login_form
  @object=UserModel.find_by_sql("select * from user_models  where email='#{params[:email]}'").last
  if session[:current_user].nil?  || session[:current_user]==@object.id
    if @object.password==params[:password]
      session[:current_user]=@object.id
      @success='true'
      @msg="Welcome #{@object.firstname}"
      render :partial=>"user_controller/NewFile.js.erb"
    else
      @success='false'
      @msg='Invalid User!!!!'
      render :partial=>"user_controller/NewFile.js.erb"
    end
  
else 
  @success="false"
  @msg=' Other user already logged in'
  render :partial=>"user_controller/NewFile.js.erb"
end
end
def edit_info
  @object=UserModel.find_by_sql("select * from user_models  where id=#{params[:key]} ").last
  render :partial=>"user_controller/UpdateInfo.js.erb"
  end
  def edit_user_info
    @object=UserModel.find(params[:id])
    @object.firstname=params[:firstname]
    @object.secondname=params[:secondname]
     @object.dob=params[:dob]
      @object.phoneNo=params[:phoneNo]
      @object.email=params[:email]
      @object.gender=params[:gender]

    @object.save
    @success='true'
    @msg="successfully Updated"
     
    @object=UserModel.where("id=?", params[:id]).last
    render :partial=>"blog_controller/backPage.js.erb" 
    
    

  end
end
