require 'rails_helper'

RSpec.describe Cocktail, type: :model do
  describe Cocktail do
    it { should belong_to(:user) }
  end
end