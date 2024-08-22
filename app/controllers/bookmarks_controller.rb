class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(book_params)
    @bookmark.list = @list
    @bookmark.save

    redirect_to list_path(@list)
  end

  private

  def book_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end
end
