class HomeSearched < ApplicationRecord
  def query
    searched = params["searched"]

    @searched = Home.where("address like ? or city like ? or state like ? or zip like ?", "%#{searched}%", "%#{searched}%", "%#{searched}%", "%#{searched}%")
  end
end
