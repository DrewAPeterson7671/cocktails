require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    it { should have_many(:cocktails) }
  end
end