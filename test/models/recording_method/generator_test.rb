# frozen_string_literal: true

require 'test_helper'

class RecordingMethod::GeneratorTest < ActiveSupport::TestCase
  # #generate
  test '#generate' do
    content = contents(:poop_mount)
    multi_level_params = { left_end_label: '少ない', right_end_label: '多い', level: '5' }
    binary_params = { false_label: '無し', truth_label: '有り' }
    params = ActionController::Parameters.new(
      recording_method_type: 'multi_level',
      multi_level: multi_level_params,
      binary: binary_params
    ).permit!
    generator = RecordingMethod::Generator.new(content, params)
    generator.generate

    assert_equal content.recording_method.class, RecordingMethod::MultiLevel
    assert_equal content.recording_method.left_end_label, multi_level_params[:left_end_label]
    assert_equal content.recording_method.right_end_label, multi_level_params[:right_end_label]
    assert_equal content.recording_method.level, multi_level_params[:level].to_i
  end
end
