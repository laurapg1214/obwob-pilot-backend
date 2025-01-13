class Api::SessionsController < ApplicationController
  def create
    # extract data from the QR code
    token = params[:qr_code_token]
    @user = User.find_by(authentication_token: token)
    unless @user
      render json: { success: false, error: 'Invalid QR code' }, status: :unauthorized
      return
    end

    session = @user.sessions.create
    cookies.permanent.signed[:obwob_session_token] = {
      value: session.token,
      httponly: true
    }
    render json: { success: true }, status: :ok
  end

  def authenticated 
    token = cookies.permanent.signed[:obwob_session_token]
    session = Session.find_by(token: token)
    unless session
      render json: { authenticated: false }, status: :unauthorized
      return
    end
    
    user = session.user
    render json: {
      authenticated: true,
      username: user.username
    }, status: :ok
  end

  def destroy
    token = cookies.permanent.signed[:obwob_session_token]
    session = Session.find_by(token: token)
    unless session&.destroy
      render json: { success: false }, status: :not_found
      return
    end

    render json: { success: true }, status: :ok
  end
end
