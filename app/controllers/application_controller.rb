class ApplicationController < ActionController::Base
  def after_customers_sign_up_path_for(resource)
    public_customers_mypage_path
  end

end
