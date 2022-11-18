class ReviewsController < ApplicationController
  before_action :set_list, only: %i[create]

  def destroy
    @review = Review.find(params[:id])
    @list = @review.list
    @review.destroy
    redirect_to list_path(@list), status: :see_other, notice: "Review was successfully destroyed."
  end

  def create
    @review = Review.new(review_params)
    @review.list= @list
    if @review.save
      redirect_to list_path(@list)
    else
     render "lists/show", status: :unprocessable_entity
    end
    # time = (Time.now - @review.created_at).round() / 60000

    # if time < 1
    #   @message = "less than a minute ago"
    # elsif time >= 1 && time < 2
    #   @message = "1 minute ago"
    # else
    #   @message = "#{time} minutes ago"
    # end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :created_at)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

end
