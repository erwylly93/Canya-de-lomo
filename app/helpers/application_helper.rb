module ApplicationHelper
	def display_tags(product)
		product.tags.collect{|tag| link_to tag.name.html_safe, :controller => '/tag', :action => 'show', :id => tag.id }.join(", ") if product.tags
	end
end
