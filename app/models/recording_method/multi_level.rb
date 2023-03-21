# frozen_string_literal: true

class RecordingMethod::MultiLevel < ApplicationRecord
  include RecordingMethodCommons

  validates :right_end_label, presence: true
  validates :left_end_label, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 3, less_than_or_equal_to: 10 }
  validate :level_cannot_change, on: :update

  private

  def level_cannot_change
    # 段階数が変更されると既存の記録と矛盾する可能性があるため
    errors.add(:level, 'は変更できません') if will_save_change_to_level?
  end
end
