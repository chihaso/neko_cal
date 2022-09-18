class SubjectsController < ApplicationController
  before_action :set_subject, only: %i[ show edit update destroy ]

  def index
    @subjects = Subject.all
  end

  def show
  end

  def new
    @subject = Subject.new
  end

  def edit
  end

  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        redirect_to subject_url(@subject), notice: "Subject was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def update
    respond_to do |format|
      if @subject.update(subject_params)
        redirect_to subject_url(@subject), notice: "Subject was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @subject.destroy

    respond_to do |format|
      redirect_to subjects_url, notice: "Subject was successfully destroyed."
    end
  end

  private
    def set_subject
      @subject = Subject.find(params[:id])
    end

    def subject_params
      params.require(:subject).permit(:name, :cat_id)
    end
end
