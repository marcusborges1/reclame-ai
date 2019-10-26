require 'rails_helper'

RSpec.describe Item, type: :model do
  subject { create(:item) }

  it { is_expected.to validate_presence_of(:name)     }
  it { is_expected.to validate_presence_of(:barcode)  }
  it { is_expected.to validate_presence_of(:price)    }
  it { is_expected.to validate_presence_of(:available_quantity) }

  it { is_expected.to validate_uniqueness_of(:name).case_insensitive    }
  it { is_expected.to validate_uniqueness_of(:barcode).case_insensitive }

  it { is_expected.to have_many(:sub_sales) }
  it { is_expected.to have_many(:sales).through(:sub_sales) }
end