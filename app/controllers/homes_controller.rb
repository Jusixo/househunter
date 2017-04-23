class HomesController < ApplicationController
  before_action :authenticate!, except: [:index, :search, :show]
  # GET /homes
  def index
  @homes = Home.page(params[:page]).per(6)
    @homes_search = Home.all
    if params[:search]
      @homes_search = Home.search(params[:search]).order("created_at DESC")
    else
      @homes
    end
  end


  # GET /homes/1
  def show
    @home = Home.find(params[:id])
  end

  # GET /homes/new
  def new
    @home = Home.new
  end

  # GET /homes/1/edit
  def edit
    @home = Home.find(params[:id])
  end

  # POST /homes
  def create
    @home = Home.new(home_params)

    if @home.save
      redirect_to @home, notice: 'Home was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /homes/1
  def update
    @home = Home.find(params[:id])
    if @home.update(home_params)
      redirect_to @home, notice: 'Home was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /homes/1
  def destroy
    @home = Home.find(params[:id])
    @home.destroy
    redirect_to homes_url, notice: 'Home was successfully destroyed.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def home_params
    params.require(:home).permit(:address, :city, :state, :zip, :bedroom, :bath, :square_feet, :price, :description, :parking, :roof_type, :lot_size, :hoa, :hoa_fee, :number_of_floors, :year_built, :image)
  end
end
