# frozen_string_literal: true

require_relative '../rails_helper'

RSpec.describe User, type: :model do

  let!(:correct_1) do
    { name: 'test1', surname: 'test1', login: 'test1', email: 'test1@bmst.ru', password: 'test1test1',
      password_confirmation: 'test1test1' }
  end
  let!(:correct_2) do
    { name: 'test2', surname: 'test2', login: 'test2', email: 'test2@bmst.ru', password: 'test2test2',
      password_confirmation: 'test2test2' }
  end
  let!(:repeat_all) do
    { name: 'test2', surname: 'test2', login: 'test2', email: 'test2@bmst.ru', password: 'test2test2',
      password_confirmation: 'test2test2' }
  end
  let!(:repeat_login) do
    { name: 'test3', surname: 'test3', login: 'test2', email: 'test3@bmst.ru', password: 'test3test3',
      password_confirmation: 'test3test3' }
  end
  let!(:repeat_email) do
    { name: 'test4', surname: 'test4', login: 'test4', email: 'test2@bmst.ru', password: 'test4test4',
      password_confirmation: 'test4test4' }
  end
  let!(:incorrect_login) do
    { name: 'test5', surname: 'test5', login: '', email: 'test5@bmst.ru', password: 'test5test5',
      password_confirmation: 'test5test5' }
  end
  let!(:incorrect_email_1) do
    { name: 'test6', surname: 'test6', login: 'test6', email: 'test6bmstru', password: 'test6test6',
      password_confirmation: 'test6test6' }
  end
  let!(:incorrect_email_2) do
    { name: 'test8', surname: 'test8', login: 'test8', email: 'em.ail', password: 'test8test8',
      password_confirmation: 'test8test8' }
  end
  let!(:empty_email) do
    { name: 'test9', surname: 'test9', login: 'test9', email: '', password: 'test9test9',
      password_confirmation: 'test9test9' }
  end
  let!(:empty_password) do
    { name: 'test10', surname: 'test10', login: 'test10', email: 'test10@bmstu.ru',
      password: '', password_confirmation: 'testtest10' }
  end

  let!(:empty_confirmed_password) do
    { name: 'test11', surname: 'test11', login: 'test11', email: 'test11@bmstu.ru',
      password: 'test11test11', password_confirmation: '' }
  end

  let!(:empty_login) do
    { name: 'test13', surname: 'test13', login: '', email: 'test13@bmstu.ru',
      password: 'test13test13', password_confirmation: 'test13test13' }
  end

  let!(:not_match) do
    { name: 'test14', surname: '', login: 'test14', email: 'test14@bmstu.ru',
      password: 'test14test14', password_confirmation: 'test15test15' }
  end

  let!(:short_password) do
    { name: 'test16', surname: 'test16', login: 'test16', email: 'test16@bmstu.ru',
      password: 'test16', password_confirmation: 'test16' }
  end

  let!(:correct_user_1) { User.create(correct_1) }
  let!(:correct_user_2) { User.create(correct_2)}
  let!(:user_email_repeat) { User.new(repeat_email) }
  let!(:user_login_repeat) { User.new(repeat_login) }
  let!(:user_all_repeat) { User.new(repeat_all) }
  let!(:user_incorrect_login) { User.new(incorrect_login) }
  let!(:user_incorrect_email_1) { User.new(incorrect_email_1) }
  let!(:user_incorrect_email_2) { User.new(incorrect_email_2) }
  let!(:user_empty_email) { User.new(empty_email) }
  let!(:user_empty_login) { User.new(empty_login) }
  let!(:user_empty_password) { User.new(empty_password) }
  let!(:user_empty_confirmed_password) { User.new(empty_confirmed_password) }
  let!(:user_passwords_not_match) { User.new(not_match) }
  let!(:user_short_password) { User.new(short_password) }
  
  context 'valid params' do
    it 'should be succesful 1' do
      expect(correct_user_1.valid?).to eq(true)
    end
    it 'should be succesful 2' do
      expect(correct_user_2.valid?).to eq(true)
    end
  end

  context 'repeated params' do
      it 'repeated email' do
          user_email_repeat.valid?
          expect(user_email_repeat.errors[:email].first).to eq('уже существует')
      end

      it 'repeated login' do
        user_login_repeat.valid?
        expect(user_login_repeat.errors[:login].first).to eq('занят')
      end

      it 'repeated login and email' do
        user_all_repeat.valid?
        expect(user_all_repeat.errors[:email].first + user_all_repeat.errors[:login].first).to eq('уже существуетзанят')
      end
  end


  context 'invalid params' do
    it 'invalid email 1' do
        user_incorrect_email_1.valid?
        expect(user_incorrect_email_1.errors[:email].first).to eq('имеет неверное значение')
    end

    it 'invalid email 2' do
      user_incorrect_email_2.valid?
      expect(user_incorrect_email_2.errors[:email].first).to eq('имеет неверное значение')
    end
  end


  context 'empty params' do
    it 'empty email' do
      user_empty_email.valid?
      expect(user_empty_email.errors[:email].first).to eq('не может быть пустым')
    end

    it 'empty login' do
      user_empty_login.valid?
      expect(user_empty_login.errors[:login].first).to eq('не может быть пустым')
    end

    it 'empty password' do
      user_empty_password.valid?
      expect(user_empty_password.errors[:password].first).to eq('не может быть пустым')
    end

    it 'empty password' do
      user_empty_confirmed_password.valid?
      expect(user_empty_confirmed_password.errors[:password_confirmation].first).to eq('не совпадает со значением поля Пароль')
    end
  end

  it 'notifies about insufficient password length' do
    user_short_password.valid?
    expect(user_short_password.errors[:password].first).to eq('недостаточной длины (не может быть меньше 8 символов)')
  end


end
