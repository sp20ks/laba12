# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe User do
  it 'should save user' do
    a = User.new(email: 'test_model_1@example.com', password_digest: '12345')
    expect(a.save).to eq(true)
    User.last.destroy
  end

  it 'should add user in db' do
    num_of_users = User.all.length
    a = User.create(email: 'test_model_1@example.com', password_digest: '12345')
    expect(User.all.length).to eq(num_of_users + 1)
    expect(User.last).to eq(a)
    User.last.destroy
  end
end