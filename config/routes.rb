Eshop::Application.routes.draw do

  get "brand/new"

  get "brand/create"

  get "brand/edit"

  get "brand/update"

  get "brand/destroy"

  get "brand/show"

  get "brand/index"

  root to: "about#index"

  get "admin/supplier" => "admin/supplier#index"
  get "admin/supplier/new"
  post "admin/supplier/create"
  get "admin/supplier/edit"
  post "admin/supplier/update"
  post "admin/supplier/destroy"
  get "admin/supplier/show"
  get "admin/supplier/index"

  get "admin/brand" => "admin/brand#index"
  get "admin/brand/new"
  post "admin/brand/create"
  get "admin/brand/edit"
  post "admin/brand/update"
  post "admin/brand/destroy"
  get "admin/brand/show"
  get "admin/brand/index"
  
  get "about" => "about#index"
  get "about/index"

end
