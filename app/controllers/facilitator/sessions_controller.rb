class Facilitator::SessionsController < Facilitator::BaseController

  def new
    @form = SessionCreationForm.new(find_project)
  end

  def create
    @form = SessionCreationForm.new(find_project, session_creation_params)
    if @form.save
      redirect_to root_path, flash: { success: t('.success') }
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def find_project
    Project.find(params[:project_id])
  end

  def session_creation_params
    params.require(:session_creation_form).permit(session_attributes: [:date, attendances_attributes: [:id, :student_id, :presence]])
  end

end
