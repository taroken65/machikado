class User::SearchesController < ApplicationController
  def search
	  @content = params[:content]
		@method = params[:method]
		@model == "topic"
		@records = Topic.search_for(@content, @method)
	end
end