class SessionCreationForm

  include ActiveModel::Model

  attr_accessor :session

  delegate :attributes=, to: :session, prefix: true

  validate :session_is_valid

  def initialize(project, params ={})
    @project = project
    @session = @project.sessions.build
    @params = params
    prepare_attendances unless params.dig(:session_attributes, :attendances_attributes).present?
    assign_session_params if params.dig(:session_attributes).present?
  end

  def save
    session.save if valid?
    errors.empty?
  end

  private

  def session_is_valid
    errors.add(:base, 'Session is invalid') unless session.valid?
  end

  def prepare_attendances
    @project.students.map do |student|
      @session.attendances.build(student_id: student.id)
    end
  end

  def assign_session_params
    @session.attributes = session_params
  end

  def session_params
    @params.dig(:session_attributes)
  end

end
