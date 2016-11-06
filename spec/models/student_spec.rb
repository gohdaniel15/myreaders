require 'rails_helper'

RSpec.describe Student, type: :model do

  subject { build(:student) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  it { is_expected.to validate_presence_of(:class_name) }

end
