class MealbooksController < ApplicationController

  before_action :authenticate_user!

  layout "mealbook"

  def index
  end

  def show
    render locals: { mealbook: mealbook_presenter } 
  end

  def create
    if new_mealbook.save
      redirect_to new_mealbook
    else
      render :index
    end
  end

  private

  def mealbook_params
    params.require(:mealbook).permit(:mealbook_name).merge(owner: current_user)
  end

  def new_mealbook
    @_new_mealbook ||= Mealbook.new(mealbook_params)
  end

  def mealbook
    @_mealbook ||= Mealbook.find(params[:id])
  end

  def mealbook_presenter
    @_mealbook_presenter ||= MealbookPresenter.new(
      mealbook: mealbook,
      week: requested_week
    )
  end

  def requested_week
    if params[:week]
      Date.parse(params[:week])
    else
      Time.zone.now.to_date
    end
  end

end
