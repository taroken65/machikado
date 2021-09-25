class User::CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    topic = Topic.find(params[:topic_id])
    comment = current_user.comments.new(comment_params)
    comment.topic_id = topic.id
    comment.save
    redirect_to topic_path(topic)
  end

  def destroy
    Comment.find_by(id: params[:id], topic_id: params[:topic_id]).destroy
    redirect_to topic_path(params[:topic_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
