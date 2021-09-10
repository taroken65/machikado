class Admin::TopicsController < ApplicationController
  def index
   @topics = Topic.page(params[:page]).reverse_order
  end

  def show
   @topic = Topic.find(params[:id])
  end

  def destroy
   topic = Topic.find(params[:id])
   topic.destroy
   redirect_to admin_topics_path
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :body, :category_id, :age_id)
  end
end
