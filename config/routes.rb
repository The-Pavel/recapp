Rails.application.routes.draw do
  devise_for :employers, controllers: { registrations: 'employers/registrations' }
  devise_for :users
  root to: 'pages#home'
  get 'employer/dashboard/:employer_id' , to: "pages#employer_dashboard", as: 'employer_dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
