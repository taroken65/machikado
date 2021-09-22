class User::HomesController < ApplicationController
    def top
        @topics = Topic.all.order(created_at: :desc).limit(10)
        @categories = Category.all
        @view_ranks = Topic.find(ViewCount.group(:topic_id).order('count(topic_id) desc').limit(7).pluck(:topic_id))
        @favorite_ranks = Topic.find(Favorite.group(:topic_id).order('count(topic_id) desc').limit(7).pluck(:topic_id))
        @comment_ranks = Topic.find(Comment.group(:topic_id).order('count(topic_id) desc').limit(7).pluck(:topic_id))
        @user_ranks = User.find(Topic.group(:user_id).order('count(user_id) desc').limit(7).pluck(:user_id))
        @user_comment_ranks = User.find(Comment.group(:user_id).order('count(user_id) desc').limit(7).pluck(:user_id))
    end

    def about
    end


end
