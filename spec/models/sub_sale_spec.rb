require 'rails_helper'

RSpec.describe SubSale, type: :model do
  it { is_expected.to validate_presence_of(:quantity) }
  it { is_expected.to validate_presence_of(:subtotal) }

  it { is_expected.to belong_to(:sale) }
  it { is_expected.to belong_to(:item) }
end