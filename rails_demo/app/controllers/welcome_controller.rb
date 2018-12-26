class WelcomeController < ApplicationController
  def index

  end


  def post_txt
    @post = Post.new
    respond_to do |format|
      format.html
      format.json { render json:{} }
      format.js
    end

    #
    # if params[:email]
    #   render :text=>"false"
    # end
    # render :text=>"false"
  end
end
