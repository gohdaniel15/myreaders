class Facilitator::PagesController < Facilitator::BaseController

  def home
    @projects = current_facilitator.projects.active
  end

end
