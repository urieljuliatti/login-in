# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:model) { build(:user) }

  describe 'association' do
    it { should have_many(:bands).class_name('Band') }
  end

  describe 'validations' do
    subject(:user) { described_class.create(name: 'Mike', username: 'mike', password: '12345', admin: true) }
    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:password) }
  end
end
