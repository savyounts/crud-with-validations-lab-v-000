class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true, unless: :unique_song?
  validates :release_year, presence: true, unless: :release_year_true?
  validates :artist_name, presence: true

  def release_year_true?
    released == "True"
  end

  def unique_song?
    song = Song.find_by(title: title)
    song.artist_name != artist_name && song.release_year != release_year
  end
end

#
# 
