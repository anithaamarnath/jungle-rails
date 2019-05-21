require 'rails_helper'

RSpec.describe User, type: :model do
 describe 'Validations' do
   # validation tests/examples here
   it "is valid with email, password, firstname and lastname" do
     user = User.new(
       name: 'anitha',
       email: 'anitha@gmail.com',
       password: 'ani',
       password_confirmation: 'ani'
     )
     expect(user).to be_valid
   end

   # validation tests/examples here
   it "is not valid without a name  " do
     user = User.new(
       name: nil,
       email: 'anitha@gmail.com',
       password: 'ani',
       password_confirmation: 'ani'
     )
     expect(user).to_not be_valid
   end
   it "is not valid without an email  " do
     user = User.new(
       name: 'ani',
       email: nil,
       password: 'ani',
       password_confirmation: 'ani'
     )
     expect(user).to_not be_valid
   end
   it "is not valid without an password  " do
     user = User.new(
       name: 'ani',
       email: 'anitha@gmail.com',
       password: nil,
       password_confirmation: 'ani'
     )
     expect(user).to_not be_valid
   end
   it "is not valid without an password_confirmation  " do
     user = User.new(
       name: 'ani',
       email: 'anitha@gmail.com',
       password: 'ani',
       password_confirmation: nil
     )
     expect(user).to_not be_valid
   end
   it "is password should be equal to password confirmation " do
     user = User.new(
       name: 'ani',
       email: 'anitha@gmail.com',
       password: 'ani',
       password_confirmation: 'anit'
     )
     expect(user).to_not be_valid
   end
   it "is email should be unique  " do
     user = User.new(
       name: 'ani',
       email: 'anitha@gmail.com',
       password: 'ani',
       password_confirmation: 'ani'
     )
     user.save
     user1 = User.new(
       name: 'ani',
       email: 'Anitha1@gmail.com',
       password: 'ani',
       password_confirmation: 'ani'
     )
     user1.save

     expect(user1).to be_valid
   end
    it "is not valid  if the password to not be shorten character 3 " do
     user = User.new(
       name: 'ani',
       email: 'anitha@gmail.com',
       password: 'anitha',
       password_confirmation: 'anitha'
     )
     expect(user).to  be_valid
   end
 end

  describe 'Validations' do
   # validation tests/examples here
   it " class method " do
     user1 = User.new(
       name: 'anitha',
       email: 'anitha@gmail.com',
       password: 'ani',
       password_confirmation: 'ani'
     )
     user1.save

    user = User.authenticate_with_credentials('anitha@gmail.com','ani')
     expect(user1).to eq user

   end
   it " checking the whitespace on before and after email  " do
     user1 = User.new(
       name: 'anitha',
       email: 'anitha@gmail.com',
       password: 'ani',
       password_confirmation: 'ani'
     )
     user1.save

    user = User.authenticate_with_credentials('   anitha@gmail.com   ','ani')
     expect(user1).to eq user

   end

  end

end
