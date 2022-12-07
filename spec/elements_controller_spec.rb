# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe ElementsController do
  it 'should show message about authorization' do
    driver = Selenium::WebDriver.for :firefox
    driver.get('localhost:3000/elements/index')
    driver.manage.timeouts.implicit_wait = 50


    driver.find_element(id: 'number').send_keys(9)
    driver.find_element(id: 'str').send_keys('1 2 3 4 5 6 7 8 9')
    driver.find_element(id: 'btn').click
    driver.manage.timeouts.implicit_wait = 50

    flash = driver.find_element(id: 'flash').text
    expect(flash).to eq('Adding a sequence is not possible without authorization')
    driver.quit
  end
  it 'should redirect to sign in page if user is not authorized' do
    driver = Selenium::WebDriver.for :firefox
    driver.get('localhost:3000/elements/index')
    driver.manage.timeouts.implicit_wait = 50


    driver.find_element(id: 'number').send_keys(9)
    driver.find_element(id: 'str').send_keys('1 2 3 4 5 6 7 8 9')
    driver.find_element(id: 'btn').click
    driver.manage.timeouts.implicit_wait = 50

    expect(driver.current_url).to eq('http://localhost:3000/users/new')
    driver.quit
  end
end