require 'spec_helper'

describe Api::BookmarkController do
  before :all do
    @bookmark = FactoryGirl.create(:bookmark)
    10.times{FactoryGirl.create(:bookmark)}
  end

  describe "#search" do
    context "with valid text" do
      it "should be searched right object" do
        get :search, {q:@bookmark.title}
        Sunspot.session.should be_a_search_for(Bookmark)
        Sunspot.session.should have_search_params(:fulltext, @bookmark.title)
      end
    end

    context "with invalid text" do
      it "should not be searched right object" do
        get :search, {q:@bookmark.title}
        Sunspot.session.should be_a_search_for(Bookmark)
        Sunspot.session.should_not have_search_params(:fulltext, "test")
      end
    end
  end
end
