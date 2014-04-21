Eshop::Application.routes.draw do

  root to: 'catalog#index'

  match 'catalog' => 'catalog#index'
  match 'about' => 'about#index'
  match 'admin/supplier' => 'admin/supplier#index'
  match 'admin/brand' => 'admin/brand#index'
  match 'admin/product' => 'admin/product#index'

  get 'catalog/show'
  match 'catalog/show/:id' => 'catalog#show'
  get 'catalog/index'
  get 'catalog/latest'
  get 'catalog/search'
  get 'catalog/rss'

  get 'admin/supplier/new'
  post 'admin/supplier/create'
  get 'admin/supplier/edit'
  post 'admin/supplier/update'
  post 'admin/supplier/destroy'
  get 'admin/supplier/show'
  match 'admin/supplier/show/:id' => 'admin/supplier#show'
  get 'admin/supplier/index'

  get 'admin/brand/new'
  post 'admin/brand/create'
  get 'admin/brand/edit'
  post 'admin/brand/update'
  post 'admin/brand/destroy'
  get 'admin/brand/show'
  match 'admin/brand/show/:id' => 'admin/brand#show'
  get 'admin/brand/index'

  get 'admin/product/new'
  post 'admin/product/create'
  get 'admin/product/edit'
  post 'admin/product/update'
  post 'admin/product/destroy'
  get 'admin/product/show'
  match 'admin/product/show/:id' => 'admin/product#show'
  get 'admin/product/index'

end
