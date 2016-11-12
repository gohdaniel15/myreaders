class ProjectCreationForm < BaseForm

  attr_accessor :project

  delegate :attributes=, to: :project, prefix: true

  # validate :project_is_valid

  def initialize(facilitator, params = {})
    @facilitator = facilitator
    @project = @facilitator.projects.build
    super(params)
  end

  def save
    @project.save if valid?
    errors.empty?
  end

  private

  def project_is_valid
    errors.add(:base, 'Project is invalid') unless project.valid?
  end

end
