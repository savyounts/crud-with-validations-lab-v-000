class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: {in: %w(True False)}
  validate :release_year_required
  validates :release_year, if :release_year_true



Cannot be repeated by the same artist in the same year

Must be less than or equal to the current year
artist_name, a string
Must not be blank


  def release_year_true
    released == True
  end

  def unique_song
    song = Song.find_by(title: title)
    if song.artist_name != artist_name && song.release_year != release_year
    end
  end
  
end
