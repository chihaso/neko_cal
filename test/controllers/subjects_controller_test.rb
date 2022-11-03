# frozen_string_literal: true

require 'test_helper'

class SubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subject = subjects(:poop)
  end

  test 'should get new' do
    get new_subject_url, params: { cat_id: cats(:bchan).id }
    assert_response :success
  end

  test 'should create subject' do
    assert_difference('Subject.count') do
      post subjects_url(format: :turbo_stream), params: { subject: { cat_id: @subject.cat_id, name: @subject.name } }
    end

    assert_response :success
  end

  test 'should get edit' do
    get edit_subject_url(@subject)
    assert_response :success
  end

  test 'should update subject' do
    patch subject_url(@subject, format: :turbo_stream), params: { subject: { cat_id: @subject.cat_id, name: @subject.name } }
    assert_response :success
  end

  test 'should destroy subject' do
    assert_difference('Subject.count', -1) do
      delete subject_url(@subject, format: :turbo_stream)
    end

    assert_response :success
  end
end
