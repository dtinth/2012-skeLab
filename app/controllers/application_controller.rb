class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user_session, :current_user, :is_admin
  helper_method :can_manage_tasks
  helper_method :is_checking_attendance, :is_current_user_attending

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

    def require_admin
      raise "Forbidden" unless is_admin
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

    def is_checking_attendance
      Period.active
    end

    def is_current_user_attending
      Period.active && Period.active.users.exists?(current_user)
    end

end
