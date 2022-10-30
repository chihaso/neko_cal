# frozen_string_literal: true

class SubjectsController < ApplicationController
  before_action :set_subject

  def edit; end

  def update
    if @subject.update(subject_params)
      flash.now.notice = I18n.t('subjects.successfully_updated', subject: @subject.name)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @subject.destroy

    flash.now.notice = I18n.t('subjects.successfully_destroyed', subject: @subject.name)
  end

  private

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name)
  end
end
