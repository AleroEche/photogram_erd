require 'rails_helper'

RSpec.describe FriendRequest, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:receipient) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
