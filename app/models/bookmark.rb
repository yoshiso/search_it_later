class Bookmark < ActiveRecord::Base

  searchable do
    text :content,:url, :title
  end

end
