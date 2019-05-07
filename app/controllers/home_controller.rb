class HomeController < ApplicationController
  def index
    @posts = Post.order('random()').page(params[:page]).per(5)
  end
end
