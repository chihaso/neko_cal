# frozen_string_literal: true

class RecordingMethodValidator < ActiveModel::Validator
  def validate(recording_method)
    content = recording_method.content

    recording_method.errors.add :base, I18n.t('recording_method.duplicate_error') if content.recording_method.present?
  end
end
