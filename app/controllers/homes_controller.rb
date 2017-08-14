class HomesController < ApplicationController
  before_action :authenticate!, except: [:index, :search, :show]
  # GET /homes
  def index
    if params[:query]
      @homes = Home.search(params[:query]).order(created_at: :asc).page params[:page]
    else
      @homes = Home.all.order(created_at: :asc).page params[:page]
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

    unless @home.can_user_edit?(current_user)
      send_them_back_with_error
      return
    end
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

    unless @home.can_user_destroy?(current_user)
      send_them_back_with_error
      return
    end

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
    week_collection = Home.pluck(created_at <= 7.days(7))
  end

  private

  # Only allow a trusted parameter "white list" through.
  def home_params
    params.require(:home).permit(:address, :city, :state, :zip, :bedroom, :bath, :square_feet, :price, :description, :parking, :roof_type, :lot_size, :hoa, :hoa_fee, :number_of_floors, :year_built, :image)
  end
end
