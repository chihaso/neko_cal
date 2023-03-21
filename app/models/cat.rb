# frozen_string_literal: true

class Cat < ApplicationRecord
  has_many :subjects, dependent: :destroy

  validates :name, presence: true

  after_create :create_default_subjects

  private

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def create_default_subjects
    subject_1 = subjects.new(name: 'うんち')
    content_1_1 = subject_1.contents.new(name: '量')
    content_1_1.recording_method_multi_level = RecordingMethod::MultiLevel.new(
      left_end_label: '少ない',
      right_end_label: '多い',
      level: 10
    )
    content_1_2 = subject_1.contents.new(name: '毛の有無')
    content_1_2.recording_method_binary = RecordingMethod::Binary.new(
      false_label: '無し',
      truth_label: 'あり'
    )
    subject_2 = subjects.new(name: 'おしっこ')
    content_2_1 = subject_2.contents.new(name: '量')
    content_2_1.recording_method_multi_level = RecordingMethod::MultiLevel.new(
      left_end_label: '少ない',
      right_end_label: '多い',
      level: 10
    )

    transaction { [subject_1, subject_2].each(&:save!) }
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
end
