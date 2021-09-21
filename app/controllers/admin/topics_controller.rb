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

    @comments = Comment.all
    @today_comment =  @comments.created_today
    @yesterday_comment = @comments.created_yesterday
    @this_week_comment = @comments.created_this_week
    @last_week_comment = @comments.created_last_week

    @view_ranks = Topic.find(ViewCount.group(:topic_id).order('count(topic_id) desc').limit(7).pluck(:topic_id))
    @favorite_ranks = Topic.find(Favorite.group(:topic_id).order('count(topic_id) desc').limit(7).pluck(:topic_id))
    @comment_ranks = Topic.find(Comment.group(:topic_id).order('count(topic_id) desc').limit(7).pluck(:topic_id))
    @user_ranks = User.find(Topic.group(:user_id).order('count(user_id) desc').limit(7).pluck(:user_id))
    @user_comment_ranks = User.find(Comment.group(:user_id).order('count(user_id) desc').limit(7).pluck(:user_id))
  end

  def today
    @topics = Topic.all
    @today_topics =  @topics.created_today.page(params[:page]).reverse_order
  end

  def yesterday
    @topics = Topic.all
    @yesterday_topics =  @topics.created_yesterday.page(params[:page]).reverse_order
  end

  def thisweek
    @topics = Topic.all
    @this_week_topics =  @topics.created_this_week.page(params[:page]).reverse_order
  end

  def lastweek
    @topics = Topic.all
    @last_week_topics =  @topics.created_last_week.page(params[:page]).reverse_order
  end


  private

  def topic_params
    params.require(:topic).permit(:title, :body, :category_id, :age_id)
  end
end
