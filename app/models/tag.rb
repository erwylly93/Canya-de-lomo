class Tag < ActiveRecord::Base
  # attr_accessible :title, :body
  
  def self.clean
    ActiveRecord::Base.connection.execute %!
      delete from tags
      where taggings_count = 0
    !
  end
end
