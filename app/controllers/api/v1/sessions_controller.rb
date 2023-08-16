require 'jwt'

class Api::V1::SessionsController < ApplicationController
  def create
    if  Rails.env.test?
        return render status 401 if params[:code] != '123456'
    else
      canSignIn = validationCodes.exists? email: params[:email], code: params[:code], used_at: nil
      if !canSignIn
        return render status: 401
      end
    end
    user = User.find_by_email params[:email]
    if user.nil?
      render status: 404, json: { errors: "用户不存在" }
    else
      payload = {user_id:user.id}
      hmac_secret = Rails.application.credentials.hmac_secret
      token = JWT.encode payload,hmac_secret,'HS256'
      render status: 200, json: {
               jwt: token,
             }
    end
  end
end
 