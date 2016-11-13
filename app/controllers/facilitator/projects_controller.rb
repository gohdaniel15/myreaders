class Facilitator::ProjectsController < Facilitator::BaseController

  def index
    @projects = current_facilitator.projects.active.all
  end

  def show
  end

  def new
    @project_creation_form = ProjectCreationForm.new(current_facilitator)
  end

  def create
    @project_creation_form = ProjectCreationForm.new(current_facilitator, project_creation_params)
    if @project_creation_form.save
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

  def find_facilitator
    Facilitator.find(params[:id])
  end

  def project_creation_params
    params.require(:project_creation_form).permit(project_attributes: [:name, :location, :start_on, students_attributes: [:id, :name, :class_name, :birthday, :comments, :_destroy]])
  end

end
