class UsersController < ApplicationController

  def downgrade_user
    @wikis = Wiki.all
    current_user.standard!
    @wikis.where(private: true, user: current_user).update_all(private: false)

    flash[:notice] = "Your account has been downgraded to standard and all your private wikis are public"
    redirect_to wikis_path
  end

end
