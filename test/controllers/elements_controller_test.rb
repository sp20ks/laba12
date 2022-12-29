# frozen_string_literal: true

require 'test_helper'

class ElementsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get elements_index_url
    assert_response :success
  end

  test 'should get result' do
    get elements_result_url
    assert_response :success
  end

  test 'should get show_all' do
    get elements_show_all_url
    assert_response :success
  end
end
