module HomesHelper
  def home_clicked_class(user, home)
    favorite = Favorite.find_by(user: user, home: home)

    if favorite
      "clicked"
    else
      ""
    end
  end
end
