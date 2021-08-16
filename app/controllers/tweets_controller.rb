class TweetsController < ApplicationController

	def index
		
	end

	def tweet
		if params[:user_id].present?  and params[:body].present?
		   @user = User.find_by_id(params[:user_id])
		    if @user
		       @tweet = Tweet.create(body:params[:body],user_id:@user.id)
		    else
		    	flash[:error] = "Please Login Again"
		    	redirect_to new_user_session_path
		    end
		else
			flash[:error] = "Something went wrong"
		end
	end

	def all_tweet
		@tweet = Tweet.all.order("created_at ASC")
	end

	def delete_tweet
	   @tweet = Tweet.find_by_id(params[:tweet_id])
		if @tweet
		   @tweet.delete
		   flash[:sucess] = "Tweet Deleted Sucessfully"
		else
			flash[:error] "Tweet Not Found"
		end
    end
end
