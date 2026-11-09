class CkeditorBaseController < ApplicationController
  before_action { head :unauthorized unless session[:admin_ok] }
end
