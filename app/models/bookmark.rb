# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  url        :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Bookmark < ActiveRecord::Base

  searchable do
    text :content,:url, :title
  end

end
