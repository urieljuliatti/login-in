# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Band, type: :model do
  subject(:model) { build(:band) }

  describe 'association' do
    it { should belong_to(:user).class_name('User') }
  end

  describe 'validations' do
    subject(:band) { described_class.create(name: 'Sodom') }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:name) }
  end
end
