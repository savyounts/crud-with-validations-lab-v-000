class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true, unless: :not_unique_song?
  validates :release_year, presence: true, unless: :release_year_true?
  validates :artist_name, presence: true

  def release_year_true?
    released == "True"
  end

  def not_unique_song?
    Song.find_by(title: title, release_year: release_year, artist_name: artist_name)
  end
end

#
#
