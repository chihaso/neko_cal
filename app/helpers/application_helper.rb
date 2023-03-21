# frozen_string_literal: true

module ApplicationHelper
  def render_recording_method_setting(content)
    case content.recording_method
    when RecordingMethod::MultiLevel
      render('/recording_methods/multi_level', resource: content.recording_method)
    when RecordingMethod::Binary
      render('/recording_methods/binary', resource: content.recording_method)
    end
  end

  def recording_method_option_index(recording_method)
    if recording_method.present?
      [RecordingMethod::MultiLevel, RecordingMethod::Binary].index(recording_method.class)
    else
      0
    end
  end
end
