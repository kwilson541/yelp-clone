require 'rails_helper'

Rspec.feature 'reviewing', :type => :feature  do
  include WebHelpers
  # before { Restaurant.create name: 'KFC' }
  let!(:kfc){Restaurant.create(name:'KFC') }

  scenario 'allows users to leave a review using a form' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'
    click_link 'KFC'
    expect(current_path).to eq "/restaurants/#{kfc.id}"
    expect(page).to have_content('so so')
  end
end
