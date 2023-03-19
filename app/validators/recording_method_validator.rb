# frozen_string_literal: true

class RecordingMethodValidator < ActiveModel::Validator
  def validate(recording_method)
    content = recording_method.content
    associated_resource = content.recording_method

    return unless associated_resource.present? && associated_resource != recording_method

    recording_method.errors.add :base, I18n.t('recording_method.duplicate_error')
  end
end
