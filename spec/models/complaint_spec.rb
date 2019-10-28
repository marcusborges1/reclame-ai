require 'rails_helper'

RSpec.describe Complaint, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:order_number) }
  it { is_expected.to validate_presence_of(:delivery_cep) }

  it { is_expected.to belong_to(:sale) }
end