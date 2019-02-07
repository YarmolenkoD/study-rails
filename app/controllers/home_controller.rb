class HomeController < ApplicationController
  def index
    redirect_to "/user/#{current_user.id}"
  end
end
 