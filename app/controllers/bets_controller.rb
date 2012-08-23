class BetsController < ApplicationController
  before_filter :require_user, :only => [:new, :create, :edit, :update]

  load_and_authorize_resource

  def index
    if params[:profile_id].present?
      @bets = User.find(params[:profile_id]).bets
    else
      @bets = Bet.all
    end
  end

  def show
    @bet = Bet.find(params[:id])
  end

  def new
    @bet = Bet.new
  end

  def edit
    @bet = current_user.bets.find(params[:id])
  end

  def create
    @bet = Bet.new(params[:bet])
    @bet.user = current_user
    if @bet.save
      redirect_to @bet, notice: 'Bet was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @bet = current_user.bets.find(params[:id])

    if @bet.update_attributes(params[:bet])
      redirect_to @bet, notice: 'Bet was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @bet = current_user.bets.find(params[:id])
    @bet.destroy

    redirect_to bets_url
  end
end
