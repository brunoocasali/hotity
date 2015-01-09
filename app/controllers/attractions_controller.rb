class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  def index
    #@attractions = Attraction.order(display_date: :asc)
    @attractions_new = Attraction.attractions_new
    @attractions_old = Attraction.attractions_old
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)

    if @attraction.save
      redirect_to attractions_path, notice: 'Attraction was successfully created.'
    else
      render :new
    end
  end

  private
    def set_attraction
      @attraction = Attraction.find(params[:id])
    end

    def attraction_params
      params.require(:attraction).permit(:user_id, :name, :midia, :display_date)
    end
end
