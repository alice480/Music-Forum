class CommentsController < ApplicationController
  before_action :set_review, only: %i[create show]

  def new; end

  def show; end

  def create
    @comment = @review.comments.build(comment_params)
    @comment.review_id = @review.id
    @comment.users_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to review_path(@review), notice: 'Comment was successfully created.' }
      else
        format.html { redirect_to review_path(@review), notice: 'Nothing' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def set_review
    @review = Review.find(params[:review_id])
  end
end
