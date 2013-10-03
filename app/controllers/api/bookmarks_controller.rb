class Api::BookmarksController < ApplicationController
  #respond_to :json

  def search
    @search = Bookmark.search do
      fulltext params["q"]
    end
    @bookmarks = @search.results
    p @bookmarks
    render 'api/bookmarks/search.json'
  end

end
