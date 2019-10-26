require 'rails_helper'

RSpec.describe Sale, type: :model do
  subject { create(:sale, order_number: 'a12345') }

  it { is_expected.to validate_presence_of(:order_number) }
  it { is_expected.to validate_presence_of(:total_value) }

  it { is_expected.to validate_uniqueness_of(:order_number) }
end