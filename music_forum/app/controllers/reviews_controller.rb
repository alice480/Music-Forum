class ReviewsController < ApplicationController

  def new
    @review = current_user.reviews.build
  end

  def create
    @review = current_user.reviews.build(review_params)
    respond_to do |format|
      if @review.save
        format.html { redirect_to '/', notice: 'Review was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end


  def show
    @comment = Comment.new
  end

  def update;
    create
  end

  private

  def review_params
    params.require(:review).permit(:topic, :text)
  end

  def error_messages
    @review.errors.as_json
  end
end


