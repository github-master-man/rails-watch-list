class BookmarksController < ApplicationController
  # GET /lists/:list_id/bookmarks/new
  def new
    # We need @list in our `simple_form_for`
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    # render 'app/views/bookmarks/new.html.erb'
  end

  # POST /lists/:list_id/bookmarks
  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list) # redirects to list show page (controller: ListsController#show | view: app/views/lists/show.html.erb)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def destroy
    @bookmarks = Bookmark.find(params[:id])
    @bookmarks.destroy
    redirect_to list_path(@bookmarks.list), status: :see_other
  end
end
