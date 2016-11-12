class BaseForm

  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment

  def initialize(params = {})
    self.attributes = params unless params.nil? || params.empty?
  end

end
