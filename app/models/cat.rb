# frozen_string_literal: true

class Cat < ApplicationRecord
  has_many :subjects, dependent: :destroy

  validates :name, presence: true
end
