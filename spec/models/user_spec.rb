require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates a user if username is present and is unique' do
    user = User.create(username: "testuser1")
    expect(User.first.username).to eq("testuser1")
  end

  it "doesn't create user if username is not present" do
    user = User.create
    expect(User.first).to be(nil)
  end

  it "doesn't create user if username is not uniuqe" do
    user1 = User.create(username: "testuser1")
    user2 = User.create(username: "testuser1")
    expect(User.first.username).to eq("testuser1")
    expect(User.second).to be(nil)
  end  

end
