Class UsersController < ApplicationController

  def index
  
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def new

  end

  def edit

  end

  def update
  
  end

end
