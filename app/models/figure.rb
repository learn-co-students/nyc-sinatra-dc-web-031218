class Figure < ActiveRecord::Base
  has_many :landmarks
  has_many :figures_titles
  has_many :titles, through: :figures_titles
end
