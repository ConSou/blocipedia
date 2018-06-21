class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!, except: [:index]

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
