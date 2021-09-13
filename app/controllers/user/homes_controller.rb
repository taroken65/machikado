class User::HomesController < ApplicationController
    def top
        @topics = Topic.all.order(created_at: :desc).limit(5)
    end

    def about
    end
end
