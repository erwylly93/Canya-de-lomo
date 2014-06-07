class TagController < ApplicationController
  def list
		@page_title = 'Lista de tags'
    @tags = Tag.paginate :page => params[:page], :order => :name, :per_page => 5
  end

  def show
		tag = Tag.find(params[:id])
		@page_title = "Productos relacionados con '#{tag.name}'"
		@products = Product.tagged_with(tag.name)
  end
end
