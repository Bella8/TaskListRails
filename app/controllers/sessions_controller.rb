class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create, :index]

  def index
    @user = User.find(session[:user_id])
    redirect_to tasks_path
  end

  def create
    auth_hash = request.env['omniauth.auth']
    redirect_to login_failure unless auth_hash['uid']
    @user = User.find_by(uid: auth_hash[:uid], provider: 'github')

    if @user.nil?
      @user = User.build_from_github(auth_hash)
      render :creation_failure unless @user.save
    end
      session[:user_id] = @user.id
      redirect_to sessions_path
  end

  # def login; end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
