# frozen_string_literal: true

module RecordingMethodCommons
  extend ActiveSupport::Concern

  included do
    belongs_to :content
    validates_with RecordingMethodValidator
  end

  def to_s
    self.class.to_s.split('::').last.underscore
  end
end
