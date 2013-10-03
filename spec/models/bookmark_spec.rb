require 'spec_helper'

describe Bookmark do
  before :all do
    @bookmark = FactoryGirl.create(:bookmark)
    10.times{FactoryGirl.create(:bookmark)}
  end

  it{expect(@bookmark).to respond_to(:content)}
  it{expect(@bookmark).to respond_to(:url)}
  it{expect(@bookmark).to respond_to(:title)}
  it{expect(@bookmark).to have_searchable_field(:content)}
  it{expect(@bookmark).to have_searchable_field(:url)}
  it{expect(@bookmark).to have_searchable_field(:title)}
end
