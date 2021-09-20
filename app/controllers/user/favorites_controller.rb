class User::FavoritesController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    favorite = @topic.favorites.new(user_id: current_user.id)
    favorite.save
    #redirect_to topic_path(topic)
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    favorite = @topic.favorites.find_by(user_id: current_user.id)
    favorite.destroy
    #redirect_to topic_path(topic)
  end
end
