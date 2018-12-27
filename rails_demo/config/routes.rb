Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  #post 'welcome/post_txt'
  post "welcome/post_txt"


  #resources :welcome, :path_names => { :new => 'post_txt', :edit => 'change' }

end

