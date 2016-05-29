class RecordedFood < ActiveRecord::Base
  belongs_to :food
  belongs_to :diary_entry

  validates :part_of_day, presence: true

  validates :food, :diary_entry, presence: true
end
