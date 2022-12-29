# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user data', type: :system do
  before(:each) do
    @user = User.create(name: 'test20',
                        surname: 'test20',
                        login: 'test20',
                        email: 'test20@bmstu.ru',
                        password: 'test20test20',
                        password_confirmation: 'test20test20')
  end

  scenario 'unregistered user on the main page' do
    visit 'http://127.0.0.1:3000'
    find_by_id('enter')
    find_by_id('signup')
  end

  scenario 'user registration' do
    visit 'http://127.0.0.1:3000/users/sign_up'
    fill_in 'name', with: @user.name
    fill_in 'surname', with: @user.surname
    fill_in 'login', with: @user.login
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    fill_in 'password_confirmation', with: @user.password_confirmation
    find('#sign').click
    expect(page).to have_text ''
  end

  scenario 'an authorized user logs in' do
    visit 'http://127.0.0.1:3000/users/sign_in'
    fill_in 'login', with: @user.login
    fill_in 'password', with: @user.password
    find('#log_in').click
    expect(page).to have_text("Здравствуйте, #{@user.login}")
  end

  scenario 'an authorized user logs in' do
    visit 'http://127.0.0.1:3000/users/edit'
    fill_in 'login', with: @user.login
    fill_in 'password', with: @user.password
    find('#log_in').click

    fill_in 'user_password', with: 'new_password'
    sleep(2)
    fill_in 'password_confirmation', with: 'new_password'
    fill_in 'current_password', with: @user.password
    sleep(10)
    find('#update').click
    expect(page).to have_text("Здравствуйте, #{@user.login}")
  end

  scenario 'user with a new password logs in' do
    visit 'http://127.0.0.1:3000/users/sign_in'
    fill_in 'login', with: @user.login
    fill_in 'password', with: 'new_password'
    find('#log_in').click
    expect(page).to have_text("Здравствуйте, #{@user.login}")
  end
end
