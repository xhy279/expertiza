require 'rails_helper'
require 'spec_helper'
require_relative './helpers/login_helper'
require 'selenium-webdriver'
include LogInHelper


feature 'Add someone to a team' do
  scenario 'send the invitation as sender and receive it', :js=>true do

    # sign in
    log_in('student4346', 'password')

    # Maximize the browser to show the 'Logout'
    page.driver.browser.manage.window.maximize

    # send invitation
    click_link "Ethical analysis 2"
    click_link "Your team"
    fill_in 'user_name', with: 'student4347'
    click_button 'Invite'
    expect(page). to have_content('Waiting for reply')

    # log out
    click_link 'Logout'

    # sign in as the receiver
    log_in('student4347','password')
    click_link "Ethical analysis 2"
    click_link "Your team"

    # accept invitation
    click_link 'Accept'

    # confirm pop out message
    page.driver.browser.switch_to.alert.accept

    # expect the sender student4346 appears on the page
    expect(page). to have_content('student4346')

  end

  scenario "should not be possible when members amount is up to 3" do

    # sign in
    log_in('student4346', 'password')

    # send invitation
    click_link "Ethical analysis 2"
    click_link "Your team"
    fill_in 'user_name', with: 'student4349'
    click_button 'Invite'
    expect(page). to_not have_content('Waiting for reply')
  end

end
