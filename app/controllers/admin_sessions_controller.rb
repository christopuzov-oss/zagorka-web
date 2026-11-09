# Session-based login for the CMS (/site_admin) with a real logout.
# Inherits ActionController::Base on purpose: skips the site's age gate and menu loading.
class AdminSessionsController < ActionController::Base
  protect_from_forgery with: :exception
  layout false

  def new
  end

  def create
    cfg = Rails.application.config
    valid = cfg.username.present? && cfg.password.present? &&
            ActiveSupport::SecurityUtils.secure_compare(params[:username].to_s, cfg.username.to_s) &
            ActiveSupport::SecurityUtils.secure_compare(params[:password].to_s, cfg.password.to_s)

    if valid
      reset_session
      session[:admin_ok] = true
      redirect_to '/site_admin'
    else
      flash.now[:alert] = 'Грешно потребителско име или парола.'
      render :new, status: :unauthorized
    end
  end

  def destroy
    reset_session
    redirect_to admin_login_path
  end
end
