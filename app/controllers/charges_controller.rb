class ChargesController < ApplicationController

  @@default_amount = 1000

  def create

   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )

   charge = Stripe::Charge.create(
     customer: customer.id,
     amount: @@default_amount,
     description: "Premium Membership - #{current_user.email}",
     currency: 'usd'
   )

   flash[:notice] = "Enjoy your premium membership #{current_user.email}!  We appricate your business."
   current_user.premium!
   redirect_to wikis_path

   rescue Stripe::CardError => e
     flash[:alert] = e.message
     redirect_to new_charge_path

 end

 def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Premium Membership - #{current_user.email}",
      amount: @@default_amount
    }
  end

  def downgrade_user
    current_user.standard!
    flash[:notice] = "Your account has been downgraded to standard"
    redirect_to wikis_path
  end

end
