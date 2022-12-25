# frozen_string_literal: true

class Cat < ApplicationRecord
  DEFAULT_SUBJECTS = %w[うんち おしっこ].freeze

  has_many :subjects, dependent: :destroy

  validates :name, presence: true

  after_create :create_default_subjects

  private

  def create_default_subjects
    DEFAULT_SUBJECTS.each { subjects.create(name: _1) }
  end
end
