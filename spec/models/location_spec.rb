# frozen_string_literal: true

require 'rails_helper'

describe Location do
  describe 'associations' do
    it { is_expected.to have_and_belong_to_many :users }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :latitude }
    it { is_expected.to validate_presence_of :longitude }
  end
end
