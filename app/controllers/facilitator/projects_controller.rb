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
    @project_modification_form = ProjectModificationForm.new(find_project)
  end

  def update
    @project_modification_form = ProjectModificationForm.new(find_project, project_modification_params)
    if @project_modification_form.save
      redirect_to root_path, flash: { success: t('.success') }
    else
      render :edit
    end
  end

  private

  def find_project
    Project.find(params[:id])
  end

  def find_facilitator
    Facilitator.find(params[:id])
  end

  def project_creation_params
    params.require(:project_creation_form).permit(project_attributes: [:name, :location, :start_on, :end_on, :status, students_attributes: [:id, :name, :class_name, :birthday, :comments, :_destroy]])
  end

  def project_modification_params
    params.require(:project_modification_form).permit(project_attributes: [:name, :location, :start_on, :end_on, :status, students_attributes: [:id, :name, :class_name, :birthday, :comments, :_destroy]])
  end

end
