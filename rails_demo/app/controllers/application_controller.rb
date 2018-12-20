class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render html: "hello, world!"
  end


  def hello1
    render html: "hello, world!1"
  end


  def hello2
    render html: "hello, world!2"
  end

    # def hello
  #   render text: "!!!!!!!!!"
  # end


end
