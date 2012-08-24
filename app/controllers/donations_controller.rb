class DonationsController < ApplicationController
  before_filter :require_user

  load_and_authorize_resource

  def new
    @donation = Donation.new
  end

  def create
    bet = Bet.find(params[:bet_id])

    @donation       = Donation.new(params[:bet])
    @donation.bet   = bet
    @donation.user  = current_user

    if @donation.save
      redirect_to @donation.bet, :notice => "You have donated bet \"#{@donation.bet.title}.\""
    else
      render :action => "new"
    end
  end
end
