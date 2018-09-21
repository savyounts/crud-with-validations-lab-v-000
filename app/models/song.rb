class ReleaseYearValidator < ActiveModel::Validator
  def validate(record)
    if record.released == "true" && record.release_year.nil?
      record.errors[:base] << "Must fill in release year"
    end
  end
end

class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: [:artist_name, :release_year]}
  validates :artist_name, presence: true
  validates :release_year, numericality: {less_than_or_equal_to: DateTime.now.year}
  validates :release_year, presense: true,
    unless: Proc.new { |a| a.released == "false" }

end

#
#
