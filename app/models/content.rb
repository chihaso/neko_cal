class Content < ApplicationRecord
  belongs_to :subject

  validates :name, presence: true
end
