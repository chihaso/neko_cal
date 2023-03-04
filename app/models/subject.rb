# frozen_string_literal: true

class Subject < ApplicationRecord
  belongs_to :cat
  has_many :contents, dependent: :destroy

  validates :name, presence: true
end
