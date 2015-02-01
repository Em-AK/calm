class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def clear_scopes_and_auth_refugee!
    sign_out :mediator
    sign_out :host
    authenticate_refugee!
  end

  def clear_scopes_and_auth_mediator!
    sign_out :refugee
    sign_out :host
    authenticate_mediator!
  end

  def clear_scopes_and_auth_host!
    sign_out :refugee
    sign_out :mediator
    authenticate_host!
  end

end
