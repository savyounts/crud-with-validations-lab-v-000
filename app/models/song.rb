class Song < ActiveRecord::Base
  validates :title, presence: true, uniquieness: true, unless: :unique_song?
  validates :released, inclusion: {in: %w(True False)}
  validate :release_year_required
  validates :release_year, if :release_year_true
  validates :artist_name, presence: true


  def release_year_true
    released == True
  end

  def unique_song?
    song = Song.find_by(title: title)
    if song.artist_name != artist_name && song.release_year != release_year
      true
    end
  end

end
