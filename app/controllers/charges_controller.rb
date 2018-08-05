class ChargesController < ApplicationController
    def new
        @order = current_order 
        session[:order_id] = @order.id
        @amount = current_order.subtotal * 100
    end

    def thanks
    end 
    
    def create
      # Amount in cents
       total_in_cents =current_order.subtotal * 100
       @amount = total_in_cents.to_i
       @order = current_order
    
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )
    
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => @order.id,
        :currency    => 'eur'
      )

      if charge["paid"] == true
        current_order.complete!
        session.delete(:order_id)
        @user = current_user
        UserNotifierMailer.send_lesson_email(@user).deliver
       end
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end

    private
   def order_params
    params.require(:order).permit(:id)
   end
   
end

