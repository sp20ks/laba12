# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe UsersController do
  it 'check url of page' do
    driver = Selenium::WebDriver.for :firefox
    driver.get('localhost:3000')
    expect(driver.current_url).to eq('http://localhost:3000/')
    driver.quit
  end

  it 'show message about successful registration' do
    driver = Selenium::WebDriver.for :firefox
    driver.get('localhost:3000/users/new')
    driver.manage.timeouts.implicit_wait = 50

    driver.find_element(id: 'email').send_keys('test_2@example.com')
    driver.find_element(id: 'pass').send_keys('1234567')
    driver.find_element(id: 'sign_btn').click
    driver.manage.timeouts.implicit_wait = 50

    flash = driver.find_element(id: 'flash').text
    expect(flash).to eq('Welcome, test_2@example.com!')
    driver.quit
  end

  it 'show message about using entered email' do
    driver = Selenium::WebDriver.for :firefox
    driver.get('localhost:3000/users/new')
    driver.manage.timeouts.implicit_wait = 50

    driver.find_element(id: 'email').send_keys('example_1@example.com')
    driver.find_element(id: 'pass').send_keys('1234567890')
    driver.find_element(id: 'sign_btn').click
    driver.manage.timeouts.implicit_wait = 50

    flash = driver.find_element(id: 'flash').text
    expect(flash).to eq('Email has already been taken')
    driver.quit
  end
end
