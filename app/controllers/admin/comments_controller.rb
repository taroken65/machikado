class Admin::CommentsController < ApplicationController
  def index
    @comments = Comment.page(params[:page]).reverse_order
  end



  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
