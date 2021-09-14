class User::HomesController < ApplicationController
    def top
        @topics = Topic.all.order(created_at: :desc).limit(10)
        @view_ranks = Topic.find(ViewCount.group(:topic_id).order('count(topic_id) desc').limit(10).pluck(:topic_id))
        @favorite_ranks = Topic.find(Favorite.group(:topic_id).order('count(topic_id) desc').limit(10).pluck(:topic_id))
        @comment_ranks = Topic.find(Comment.group(:topic_id).order('count(topic_id) desc').limit(10).pluck(:topic_id))
    end

    def about
    end


end
