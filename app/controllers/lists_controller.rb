class ListsController < ApplicationController

  # GET /lists
  def index
    # @lists is an Array of List objects
    @lists = List.all
  end

  # GET /lists/:id (eg. /lists/42)
  def show
    # Find the list with the ID of 42
    # @ list is a single List object
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to list_path(@list)
    else
      # show some sort of error
      render :new, status: :unprocessable_entity
    end
  end

  def list_params
    params.require(:list).permit(:name)
  end
end



# index is multiple lists and the show page is 1 list
# need a view for each of these
# index.html.erb
# show.html.erb

# put these inside "lists"
