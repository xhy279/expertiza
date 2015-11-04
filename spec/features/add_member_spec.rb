require 'rails_helper'
require 'spec_helper'
require_relative './helpers/login_helper'
include LogInHelper

feature 'Add someone to a team' do

  def send_invi
    visit '/student_task/list'
    click_link "wiki"
    clike_link "Your team"
    fill_in '', with: 'student4130'
    click_button 'Invite'
    expect(page).to have_content ""
  end

  # sign in
  log_in('student', 'bd08fb03e2e3115964b1b39ea40625292a776a86')

  # send invitation
    send_invi

  # log out
  def log_out

  end
  # sign in as the receiver
  login('','')

  # Click accept

  # log out

  # sign in as invitation sender

  # In Your team view should appear receiver name




  end
