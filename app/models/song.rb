class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: {in: %w(True False)}
  validates :release_year, presence: true,  if :release_year_true?
  validates :artist_name, presence: true


  def release_year_true?
    released == True
  end


end
