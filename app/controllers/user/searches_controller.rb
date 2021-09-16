class User::SearchesController < ApplicationController
   def search
	 @topics = Topic.search(params[:keyword])
	 @comments = Comment.search(params[:keyword])
   @keyword = params[:keyword]
   end

end
