# frozen_string_literal: true

class RecordingMethod::Binary < ApplicationRecord
  belongs_to :content

  validates_with RecordingMethodValidator
  validates :truth_label, presence: true
  validates :false_label, presence: true
end
