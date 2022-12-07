# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

# testing model
RSpec.describe Element do
  it 'should save sequnce' do
    a = Element.new(arr: '1 2 3 4 5 5 5 5 0 9 625 625 5 5 625 625', length: 16)
    expect(a.save).to eq(true)
    Element.last.destroy
  end

  it 'should add sequnce in db' do
    num_of_elements = Element.all.length
    a = Element.create(arr: '1 2 3 4 5 5 5 5 0 9 625 625 5 5 625 625', length: 16)
    expect(Element.all.length).to eq(num_of_elements + 1)
    expect(Element.last).to eq(a)
    Element.last.destroy
  end

  it 'should initialize max_subarr before save' do
    a = Element.create(arr: '1 2 3 4 5 5 5 5 0 9 625 625 5 5 625 625', length: 16)
    expect(a.max_subarr).to eq('[625, 625, 5, 5, 625, 625]')
    Element.last.destroy
  end
end
