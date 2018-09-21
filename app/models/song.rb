class ReleaseYearValidator < ActiveModel::Validator
  def validate(record)
    if record.released == "true" && record.release_year.blank?
      record.errors[:base] << "Must fill in release year"
    end
  end
end

class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: false, unless: :not_unique_song?
  validates_with ReleaseYearValidator
  validates :artist_name, presence: true

  # def release_year_false?
  #   released == "false"
  # end

  def not_unique_song?
    Song.find_by(title: title, release_year: release_year, artist_name: artist_name)
  end
end

#
#
