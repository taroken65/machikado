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

  def top
    @topics = Topic.all
    @today_topic =  @topics.created_today
    @yesterday_topic = @topics.created_yesterday
    @this_week_topic = @topics.created_this_week
    @last_week_topic = @topics.created_last_week

    @users = User.all
    @today_user =  @users.created_today
    @yesterday_user = @users.created_yesterday
    @this_week_user = @users.created_this_week
    @last_week_user= @users.created_last_week
  end

  def today
    @topics = Topic.all
    @today_topics =  @topics.created_today
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :body, :category_id, :age_id)
  end
end
