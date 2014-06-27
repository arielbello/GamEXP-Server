class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # Can't set this to true! Unity web plugin wouldn't be able to communicate with the server.
  protect_from_forgery with: :null_session


  def authenticate
  	authenticate_or_request_with_http_digest do |username|
  		USERS[username]
  	end
  end
end
