class MealbooksController < ApplicationController

  before_action :authenticate_user!

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
    @new_mealbook ||= Mealbook.new(mealbook_params)
  end

  def mealbook
    @mealbook ||= Mealbook.find(params[:id])
  end

  def mealbook_presenter
    @_mealbook_presenter ||= MealbookPresenter.new(mealbook)
  end

end
