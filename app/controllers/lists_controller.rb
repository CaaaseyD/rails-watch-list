class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    bookmark = Bookmark.where(list_id: params[:id])
    movie_id = bookmark.map { |m| m.movie_id }
    @movies = movie_id.map { |id| Movie.find(id) }
    @review = Review.new(list:@list)
  end

  def new
    @list = List.new
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to @list, notice: "List was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_url, notice: "List was successfully destroyed."
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end
  def move
    @list = List.find(params[:id])
    @list.insert_at(params[:position].to_i)
    head :ok
  end
  private

  def list_params
    params.require(:list).permit(:name, :photo, :position)
  end
end
