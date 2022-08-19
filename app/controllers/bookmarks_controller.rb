class BookmarksController < ApplicationController

  def new
    @bookmarks = Bookmark.new
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmarks_path(@bookmark.list), status: :see_other
  end

  # def create
  #   @bookmark = Bookmark.new(bookmark_params)
  #   @bookmark.save
  #   redirect_to bookmark_path(@bookmark)
  # end
  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
