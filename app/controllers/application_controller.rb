class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user_session, :current_user, :is_admin
  helper_method :can_manage_tasks

  private
    def can_manage_tasks
      is_admin
    end

    def can_work_on_private_tasks
      is_admin
    end

    def task_manage
      raise "Forbidden" unless can_manage_tasks
    end

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def is_admin
      current_user.is_admin
    end

end
