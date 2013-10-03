require 'spec_helper'

describe Api::BookmarksController do

  before :all do
    @bookmark = FactoryGirl.create(:bookmark,content:"rails rspec content test")
    @bookmark.index!
    10.times do
      bm = FactoryGirl.create(:bookmark)
      bm.index!
    end
  end

  after :all do
    Sunspot.remove_all!(Bookmark)
  end

  describe "#search" do

    context "with valid text" do
      it "should be searched right object" do
        get :search, {q:"rails content"}
        Sunspot.session.should be_a_search_for(Bookmark)
        Sunspot.session.should have_search_params(:fulltext, "rails content")
      end
    end

    context "with invalid text" do
      it "should not be searched right object" do
        get :search, {q:"rails content"}
        Sunspot.session.should be_a_search_for(Bookmark)
        Sunspot.session.should_not have_search_params(:fulltext, "test")
      end
    end

  end
end
