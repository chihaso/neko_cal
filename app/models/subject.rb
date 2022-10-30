# frozen_string_literal: true

class Subject < ApplicationRecord
  belongs_to :cat

  validates :name, presence: true
end
