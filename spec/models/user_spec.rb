# frozen_string_literal: true

require 'rails_helper'

describe User do
  describe 'associations' do
    it { is_expected.to have_and_belong_to_many :locations }
  end
end
