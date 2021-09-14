class User::TopicsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @topics = Topic.page(params[:page]).reverse_order
  end

  def new
    @topic = Topic.new
  end

  def create
    topic = Topic.new(topic_params)
    topic.user_id = current_user.id
    topic.save
    redirect_to topic_path(topic)
  end

  def show
    @topic = Topic.find(params[:id])
    unless ViewCount.find_by(user_id: current_user.id, topic_id: @topic.id)
      current_user.view_counts.create(topic_id: @topic.id)
    end
    @comment = Comment.new
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :body, :category_id, :age_id)
  end
end
