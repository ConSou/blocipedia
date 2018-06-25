class UsersController < ApplicationController

  def downgrade_user
    current_user.standard!
    flash[:notice] = "Your account has been downgraded to standard"
    redirect_to wikis_path
  end
  
end
