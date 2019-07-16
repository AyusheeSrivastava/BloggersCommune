Rails.application.routes.draw do
  get 'comments_controller/users_comment'
  post'comments_controller/create_comment'

  get 'blog_controller/create_blog'

  get 'blog_controller/edit_blog'
  post'blog_controller/edit_user_blog'

  get 'blog_controller/view_blog'
  post 'blog_controller/create_user_blog'
  get 'blog_controller/delete_your_blog'
  get 'blog_controller/users_blog'
  get 'blog_controller/logout_user'
  get  'blog_controller/backToHome'

  get 'user_controller/welcome_method'
  get 'user_controller/register_method'
  get 'user_controller/login_method'
  post 'user_controller/submit_registeration_form'
  post  'user_controller/submit_login_form'
   get 'user_controller/edit_info'
   post  'user_controller/edit_user_info'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
