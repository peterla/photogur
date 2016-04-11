class Picture < ActiveRecord::Base
  scope :newest_first, -> { order("created_at DESC") }
  scope :most_recent_five, -> { newest_first.limit(5) }

  # This class method is equivalent to
  # scope :created_before, -> (time) { where("created_at < ?", time) }
  def self.created_before(time)
    where("created_at < ?", time)
  end
end
