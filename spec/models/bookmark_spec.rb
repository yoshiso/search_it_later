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

require 'spec_helper'

describe Bookmark do
  before :all do
    @bookmark = FactoryGirl.create(:bookmark)
    @bookmark.index!
    10.times do
      bm = FactoryGirl.create(:bookmark)
      bm.index!
    end
  end

  after :all do
    Sunspot.remove_all!(Bookmark)
  end

  it{expect(@bookmark).to respond_to(:content)}
  it{expect(@bookmark).to respond_to(:url)}
  it{expect(@bookmark).to respond_to(:title)}
  it{expect(@bookmark).to have_searchable_field(:content)}
  it{expect(@bookmark).to have_searchable_field(:url)}
  it{expect(@bookmark).to have_searchable_field(:title)}
end
