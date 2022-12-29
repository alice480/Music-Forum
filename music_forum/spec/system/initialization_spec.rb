# frozen_string_literal: true

require_relative '../rails_helper'

RSpec.describe 'Correct Registration', type: :system do
  include RSpec::Expectations
  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = 'http://localhost:3000/'
    @driver.get @base_url
    @verification_errors = []
  end

  after(:each) do
    @driver.quit
  end

  describe 'check index page by root' do
    it 'has code 200' do
      expect(@driver.current_url).to eq('http://localhost:3000/')
    end
  end

  describe 'unregistered user on the main page' do
    it 'should have enter and sign up links' do
      @driver.find_element(id: 'enter')
      @driver.find_element(id: 'signup')
    end
  end

  describe 'user registers successfully' do
    it 'error message is empty' do
      @driver.navigate.to('http://127.0.0.1:3000/users/sign_up')
      user = User.create(name: 'test20',
                         surname: 'test20',
                         login: 'test20',
                         email: 'test20@bmstu.ru',
                         password: 'test20test20',
                         password_confirmation: 'test20test20')

      @driver.find_element(id: 'name').send_keys(user.name)
      @driver.find_element(id: 'surname').send_keys(user.surname)
      @driver.find_element(id: 'login').send_keys(user.login)
      @driver.find_element(id: 'email').send_keys(user.email)
      @driver.find_element(id: 'password').send_keys(user.password)
      @driver.find_element(id: 'password_confirmation').send_keys(user.password_confirmation)
      @driver.find_element(name: 'commit').click
      
      # expect(@driver.find_element(class: 'notice').text).to eq('')
      expect(response).to redirect_to("/")
      follow_redirect!
    end
  end

  describe 'user exits successfully' do
    it 'should have exit links' do
      @driver.get @base_url
      sleep(3)
      @driver.find_element(id: 'exit')
      @driver.find_element(id: 'enter')
      @driver.find_element(id: 'signup')
    end
  end

end
