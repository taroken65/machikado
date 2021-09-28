class User::TopicsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @topics = Topic.page(params[:page]).reverse_order
    @categories = Category.all
    @ages = Age.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    if @topic.save
    redirect_to topic_path(topic)
    else
     render "new"
    end
  end

  def show
    @topic = Topic.find(params[:id])
    if current_user != nil
      unless ViewCount.find_by(user_id: current_user.id, topic_id: @topic.id)
      current_user.view_counts.create(topic_id: @topic.id)
      end
    end
    @comment = Comment.new
    @categories = Category.all
    @ages = Age.all
  end

  def destroy
    topic = Topic.find(params[:id])
    topic.destroy
    redirect_to user_path(topic.user)
  end

  def category
    @category = Category.find(params[:id])
    @topics = Topic.includes(:category).where(category_id: @category)
    @categories = Category.all
    @ages = Age.all
  end

  def age
    @age =Age.find(params[:id])
    @topics = Topic.includes(:age).where(age_id: @age)
    @categories = Category.all
    @ages = Age.all
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :body, :category_id, :age_id)
  end
end
