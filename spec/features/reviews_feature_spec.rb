require 'rails_helper'

RSpec.feature 'reviewing', :type => :feature  do
  include WebHelpers
  # before { Restaurant.create name: 'KFC' }
  let!(:kfc){Restaurant.create(name:'KFC') }

  scenario 'allows users to leave a review using a form' do
    sign_up
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'
    click_link 'KFC'
    expect(current_path).to eq "/restaurants/#{kfc.id}"
    expect(page).to have_content('so so')
  end

  scenario 'user can\'t add a review without signing up' do
    visit '/restaurants'
    click_link 'Review KFC'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

end
