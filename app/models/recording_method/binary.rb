# frozen_string_literal: true

class RecordingMethod::Binary < ApplicationRecord
  include RecordingMethodCommons

  validates :truth_label, presence: true
  validates :false_label, presence: true
end
