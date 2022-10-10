require 'rails_helper'

RSpec.describe User, type: :model do
    user = User.create(fname: "ggsw", lname: "gsfs", email: "abc@gmail.com")

    it "is valid with valid attributes" do
        expect(user).to be_valid
    end

    it "is not valid without fname" do
        user.fname = nil
        expect(user).not_to be_nil
    end

    it "is not valid without lname" do
        user.lname = nil
        expect(user).not_to be_nil
    end

    it "is not valid without email" do
        user.email = nil
        expect(user).not_to be_nil
    end

    context "assosiations" do
        it "is not valid without posts asociation" do
            should have_many(:posts).class_name('Post')
        end
    end
end
