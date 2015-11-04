require 'rails_helper'
require 'spec_helper'
require_relative './helpers/login_helper'
include LogInHelper
feature 'student sign in' do

before(:each) do
  User.new(
               :name=>"student",
               :crypted_password=>"bd08fb03e2e3115964b1b39ea40625292a776a86",
               :role_id=>1,
               :password_salt=>"tQ6OGFiyL9dIlwxeSJf",
               :fullname=>"Student, Perfect",
               :email=>"pstudent@dev.null",
               :parent_id=>1,
               :private_by_default=>false,
               :mru_directory_path=>nil,
               :email_on_review=>true,
               :email_on_submission=>true,
               :email_on_review_of_review=>true,
               :is_new_user=>false,
               :master_permission_granted=>0,
               :handle=>"",
               :leaderboard_privacy=>false,
               :digital_certificate=>nil,
               :timezonepref=>"Eastern Time (US & Canada)",
               :copy_of_emails=>false,
           )

end

  scenario 'with Invalid email and password' do
    # jump to student task list
    log_in('student', 'adadsd')
    expect(page).to have_content "Incorrect Name"
  end

  scenario 'with valid email or password' do
    # jump to password retrieve page
    log_in('admin', 'd033e22ae348aeb5660fc2140aec35850c4da997')
    expect(page).to have_content 'User: admin'

  end



end

