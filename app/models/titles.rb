class Title < ActiveRecord::Base
  has_many :figures_titles
  has_many :figures, through: :figures_titles
end
