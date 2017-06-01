# frozen_string_literal: true

class ChargesController < ApplicationController
  def create
    # Amount in cents
    amount = payment_params[:amount]
    customer = Stripe::Customer.create(
      email: payment_params[:stripeEmail],
      source: payment_params[:id]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: amount,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private

  def payment_params
    params.permit(:id, :stripeEmail, :amount)
  end
end
