class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: {in: %w(True False)}
  validates :release_year, presence: true
  validates :artist_name, presence: true



end
