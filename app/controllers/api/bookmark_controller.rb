class Api::BookmarkController < ApplicationController

  respond_to :json

  def search
    @search = Bookmark.search do
      fulltext params["q"]
    end
    @bookmarks = @search.results
    render @bookmarks
  end
end
