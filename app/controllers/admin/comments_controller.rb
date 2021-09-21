class Admin::CommentsController < ApplicationController
  def index
    @comments = Comment.page(params[:page]).reverse_order
  end

  def destroy
    Comment.find_by(id: params[:id], topic_id: params[:topic_id]).destroy
    redirect_to admin_topic_path(params[:topic_id])
  end

  def today
   @comments = Comment.all
   @today_comments =  @comments.created_today.page(params[:page]).reverse_order
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
