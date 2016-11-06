class Facilitator::ProjectsController < Facilitator::BaseController

  def index
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_facilitator.projects.build(project_creation_params)
    if @project.save
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
    params.require(:project).permit(:name, :location, :start_on)
  end

end
