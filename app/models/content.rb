# frozen_string_literal: true

class Content < ApplicationRecord
  belongs_to :subject

  validates :name, presence: true
end
