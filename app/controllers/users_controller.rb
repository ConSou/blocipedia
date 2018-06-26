class UsersController < ApplicationController

  def downgrade_user

    current_user.standard!

    flash[:notice] = "Your account has been downgraded to standard and all your private wikis are public"
    redirect_to wikis_path
  end

end
