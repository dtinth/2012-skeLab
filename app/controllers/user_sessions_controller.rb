class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Logged In!"
      redirect_to root_url
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
  end

  def new_with_facebook
    redirect_to "https://www.facebook.com/dialog/oauth?" +
      "client_id=452238168130413" +
      "&redirect_uri=#{CGI.escape 'http://thai.org.org/fb/soscamp/redirect.html?to=' + CGI.escape(request.host_with_port)}" +
      "&response_type=token"
  end

  def handle_facebook_redirect
    raise "no fb" unless params[:fbid].present?
    raise "no fb" unless params[:fbname].present?
    raise "undefined" if params[:fbname] == 'undefined'
    @user = User.find_by_fbid(params[:fbid])
    unless @user
      @user = User.new(:login => "FB_#{params[:fbid]}")
      @user.password = @user.password_confirmation = "Facebook User #{params[:fbid]} #{Digest::SHA1.hexdigest("--#{Time.now.to_s}--")}"
    end
    @user.name = params[:fbname]
    @user.fbid = params[:fbid]
    @user.save
    UserSession.create(@user)
    redirect_to root_url
  end
end
