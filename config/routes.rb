Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "pages#home"


  # Sign In
  get "users/new" , to: "users#new"
  post "users" , to: "users#create"

  #Login and Logout
  get "logout", to: "users#logout" # user logout
  get "login", to: "users#login", method: :get    # get login form
  post "check_login", to: "users#check_login" # check if login was correct

  # Anticipos de Factura
  get "anticipate_invoice", to: "invoices#anticipate_invoice"
  post "pay_invoice", to: "invoices#pay_invoice"
  #Borrar Anticipo
  post "delete_advance/:id", to: "invoices#delete_advance"

end
