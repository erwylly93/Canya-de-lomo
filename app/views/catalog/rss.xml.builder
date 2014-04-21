xml.instruct!

xml.rss "version" => "2.0", "xmlns:dc" =>
"http://purl.org/dc/elements/1.1" do
	xml.channel do
		xml.title @page_title
		xml.description "Caña de lomo: ibéricos para el mundo"
		xml.link url_for :action => 'index', :only_path => false
		xml.language "en-us"
		xml.ttl "60"
		for product in @products do
			xml.item do
				xml.title product.name
				xml.description "#{product.name}, de #{product.brand.name}"
				xml.link url_for :action => 'show', :id => product, :only_path => false
				xml.guid url_for :action => 'show', :id => product, :only_path => false
				xml.pubDate product.created_at.to_s :long
				xml.suppliers product.supplier_names
			end
		end
	end
end


# xml.instruct! :xml, :version=>"1.0"

# xml.rss do
# 	xml.channel do
# 		xml.title @page_title
# 		xml.link(url_for(:action => "index", :only_path => false))
		
# 		xml.ttl "40"
# 		xml.description "Caña de lomo: ibéricos para el mundo"

# 		for product in @products
# 			xml.item do
# 				xml.title(product.name)
# 				xml.description("#{product.name} de #{product.brand.name}")
# 				xml.pubDate(product.created_at.to_s(:long))
# 				xml.guid(url_for(:action => "show", :id => product, :only_path => false))
# 				xml.link(url_for(:action => "show", :id => product, :only_path => false))
# 			end
# 		end
# 	end
# end

# xml.instruct!
# xml.products do
# 	@products.each do |product|
# 		xml.product do
# 			xml.name product.name
# 			xml.brand product.brand.name
# 			xml.suppliers product.supplier_names
# 			xml.price product.price
# 			xml.date product.created_at.to_s(:long)
#  			xml.guid(url_for(:action => "show", :id => product, :only_path => false))
# 			xml.link(url_for(:action => "show", :id => product, :only_path => false))
# 		end
# 	end
# end