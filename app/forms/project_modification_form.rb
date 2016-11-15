class ProjectModificationForm < BaseForm

  attr_accessor :project

  delegate :attributes=, to: :project, prefix: true

  validate :project_is_valid

  def initialize(project, params = {})
    @project = project
    super(params)
    @project.students.build if @project.students.blank?
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
