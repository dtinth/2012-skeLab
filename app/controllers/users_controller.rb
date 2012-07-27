class UsersController < ApplicationController
  before_filter :disable_user_creation

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registered!"
      redirect_to root_url
    else
      render :action => :new
    end
  end

  def disable_user_creation
    raise "User creation disabled!"
  end
end
