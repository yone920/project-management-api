class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def quote
    Faker::Games::LeagueOfLegends.quote
  end
end
