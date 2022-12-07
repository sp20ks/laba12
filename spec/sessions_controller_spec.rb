# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe SessionsController do
  it 'show message about successful log in' do
    driver = Selenium::WebDriver.for :firefox
    driver.get('localhost:3000')
    driver.manage.timeouts.implicit_wait = 50

    driver.find_element(id: 'email').send_keys('test_session@example.com')
    driver.find_element(id: 'pass').send_keys('12345')
    driver.find_element(id: 'log_btn').click
    driver.manage.timeouts.implicit_wait = 50

    flash = driver.find_element(id: 'flash').text
    expect(flash).to eq('you have successfully logged in')
    driver.quit
  end

  it 'show message about error in entered password' do
    driver = Selenium::WebDriver.for :firefox
    driver.get('localhost:3000')
    driver.manage.timeouts.implicit_wait = 50

    driver.find_element(id: 'email').send_keys('test_session@example.com')
    driver.find_element(id: 'pass').send_keys('1234567876543')
    driver.find_element(id: 'log_btn').click
    driver.manage.timeouts.implicit_wait = 50

    flash = driver.find_element(id: 'flash').text
    expect(flash).to eq('Incorrect password or email')
    driver.quit
  end
end