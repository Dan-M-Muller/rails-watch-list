class ListsController < ApplicationController
  before_action :set_list, only: %i[show destroy]

  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new()
  end

  def new
    @list = List.new()
  end

  def destroy
    @list.destroy!
    redirect_to lists_path
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to list_path(@list)
    else
      render "new", status: :unprocessable_entity
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end



# <!-- app/views/articles/index.html.erb -->
# <%= cl_image_tag("THE_IMAGE_ID_FROM_LIBRARY",
#       width: 400, height: 300, crop: :fill) %>
#                            Crop modes: scale, fit, fill, limit, pad, crop
# <!-- for face detection -->
# <%= cl_image_tag("IMAGE_WITH_FACE_ID",
#       width: 150, height: 150, crop: :thumb, gravity: :face) %>
