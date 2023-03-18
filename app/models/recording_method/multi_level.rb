# frozen_string_literal: true

class RecordingMethod::MultiLevel < ApplicationRecord
  belongs_to :content

  validates_with RecordingMethodValidator
  validates :right_end_label, presence: true
  validates :left_end_label, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 3, less_than_or_equal_to: 10 }
end
