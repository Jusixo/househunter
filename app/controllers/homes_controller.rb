class HomesController < ApplicationController
  before_action :authenticate!, except: [:index, :search, :show]
  # GET /homes
  def index
    @page = params[:page].to_i

    if params[:searched]
      @homes_searched =  Home.where("address like ? or city like ? or state like ? or zip = ?", "%#{params[:searched]}%", "%#{params[:searched]}%", "%#{params[:searched]}%", "#{params[:searched].to_i}")

      @suggestion = "Mansion"
    else
      @homes = Home.all.order(created_at: :desc).page(@page).per(4)
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
    @home.created_by = current_user

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

  def unfavorite
    home = Home.find(params[:homeId])

    favorite = Favorite.find_by(user: current_user, home: home)
    favorite.destroy
  end

  def favorite
    home = Home.find(params[:homeId])

    Favorite.create(user: current_user, home: home)

    HhMailer.favorites(home, current_user).deliver_later

  end

  def week_list
    week_old = Home.find_by(created_at <= 1.week_old)
  end

  private

  # Only allow a trusted parameter "white list" through.
  def home_params
    params.require(:home).permit(:address, :city, :state, :zip, :bedroom, :bath, :square_feet, :price, :description, :parking, :roof_type, :lot_size, :hoa, :hoa_fee, :number_of_floors, :year_built, :image)
  end
end
