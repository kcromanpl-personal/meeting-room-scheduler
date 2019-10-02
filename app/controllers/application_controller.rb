class ApplicationController < ActionController::Base
  # authenticating users before accesing any path
  before_action :authenticate_user!
end
