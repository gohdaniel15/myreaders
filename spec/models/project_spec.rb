require 'rails_helper'

RSpec.describe Project, type: :model do

  subject { build(:project) }

  it { is_expected.to belong_to(:facilitator).inverse_of(:projects) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:location) }
  it { is_expected.to validate_presence_of(:start_on) }
  it { is_expected.to validate_presence_of(:status) }

  it { is_expected.to define_enum_for(:status).with([:active, :inactive]) }

end
