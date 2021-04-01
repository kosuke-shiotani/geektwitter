class TweetsController < ApplicationController

  def index
    @tweets = Tweet.page(params[:page]).per(10)
  end

  def new
    @tweet = Tweet.new
  end

  def show 
    @tweet = Tweet.find(params[:id])
  end

  def create
    tweet = Tweet.new(tweet_params)
    if tweet.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: :index
  end

  private
  def tweet_params
    params.require(:tweet).permit(:body, :title, :file)
  end
end
