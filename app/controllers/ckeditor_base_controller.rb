class CkeditorBaseController < ApplicationController
  http_basic_authenticate_with name: Rails.application.config.username, password: Rails.application.config.password
end