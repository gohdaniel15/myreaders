require 'rails_helper'

RSpec.describe Admin, type: :model do

  subject { build(:admin) }

  it { is_expected.to have_many(:invitations) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(2) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  
end
