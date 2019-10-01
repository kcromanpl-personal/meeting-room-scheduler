class UsersController < ApplicationController
  # authenticating users before accesing any path
  before_action :authenticate_user!

  def index
  end
  
end
