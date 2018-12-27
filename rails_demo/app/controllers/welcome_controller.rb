
require_relative '../../script/tools/tools.rb'
SaveFileName = "output/txt/"
class WelcomeController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:post_txt]

  def index

  end

  #http://127.0.0.1:3000/welcome/post_txt  在 routes 里面需要 提前定义路由
  def post_txt
    id = params[:username]
    content = params[:content]
    respond_to do |format|
      Tools.saveFie(SaveFileName+id +  ".txt",content)
      format.json {render json: {"status" =>"success"} }
    end
  end
end
