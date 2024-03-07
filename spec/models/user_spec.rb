require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @another_user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに@が含まれていないと登録できない' do
      @user.email.slice!('@')
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it '一意性のあるemailでないと登録できない' do
      @another_user.email = 'unique@example.com'
      @another_user.valid?

      expect(@another_user.errors.full_messages).to_not include('Email has already been taken')
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = '123ab'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが英字だけだと登録できない' do
      @user.password = 'aaaaaaaa'
      @user.password_confirmation = 'aaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password must include both letters and numbers')
    end

    it 'passwordが数字だけだと登録できない' do
      @user.password = '11111111'
      @user.password_confirmation = '11111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password must include both letters and numbers')
    end

    it 'passwordとconfirmが一致していないと登録できない' do
      @user.password = 'test123'
      @user.password_confirmation = 'test1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
    end

    it 'first_nameが半角では登録できない' do
      @user.first_name = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
    end

    it 'last_nameが半角では登録できない' do
      @user.last_name = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
    end

    it 'first_name_kanaが半角では登録できない' do
      @user.first_name_kana = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid")
    end

    it 'last_name_kanaが半角では登録できない' do
      @user.last_name_kana = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
