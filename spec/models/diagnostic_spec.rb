require 'rails_helper'

RSpec.describe Diagnostic, type: :model do

  subject { described_class.new }

  it { is_expected.to belong_to(:project).inverse_of(:diagnostics) }
  it { is_expected.to belong_to(:student).inverse_of(:diagnostics) }

  it { is_expected.to validate_presence_of(:type) }
  it { is_expected.to validate_presence_of(:student) }
  it { is_expected.to validate_presence_of(:project) }
  it { is_expected.to validate_presence_of(:score) }
  it { is_expected.to validate_numericality_of(:score).is_greater_than_or_equal_to(0) }

end
