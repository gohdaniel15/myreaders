require 'rails_helper'

RSpec.describe Facilitator, type: :model do

  subject { build(:facilitator) }

  it { is_expected.to have_many(:projects).inverse_of(:facilitator) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(2) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

end
