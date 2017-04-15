require 'test_helper'

class HomesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @home = homes(:one)
  end

  test "should get index" do
    get homes_url
    assert_response :success
  end

  test "should get new" do
    get new_home_url
    assert_response :success
  end

  test "should create home" do
    assert_difference('Home.count') do
      post homes_url, params: { home: { address: @home.address, bath: @home.bath, bedroom: @home.bedroom, city: @home.city, description: @home.description, hoa: @home.hoa, hoa_fee: @home.hoa_fee, img_data: @home.img_data, lot_size: @home.lot_size, number_of_floors: @home.number_of_floors, parking: @home.parking, price: @home.price, roof_type: @home.roof_type, square_feet: @home.square_feet, state: @home.state, year_built: @home.year_built, zip: @home.zip } }
    end

    assert_redirected_to home_url(Home.last)
  end

  test "should show home" do
    get home_url(@home)
    assert_response :success
  end

  test "should get edit" do
    get edit_home_url(@home)
    assert_response :success
  end

  test "should update home" do
    patch home_url(@home), params: { home: { address: @home.address, bath: @home.bath, bedroom: @home.bedroom, city: @home.city, description: @home.description, hoa: @home.hoa, hoa_fee: @home.hoa_fee, img_data: @home.img_data, lot_size: @home.lot_size, number_of_floors: @home.number_of_floors, parking: @home.parking, price: @home.price, roof_type: @home.roof_type, square_feet: @home.square_feet, state: @home.state, year_built: @home.year_built, zip: @home.zip } }
    assert_redirected_to home_url(@home)
  end

  test "should destroy home" do
    assert_difference('Home.count', -1) do
      delete home_url(@home)
    end

    assert_redirected_to homes_url
  end
end
