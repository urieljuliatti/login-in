# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Band, type: :model do
  subject(:model) { build(:band) }

  let(:name) { 'Kreator' }

  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
  end
end
