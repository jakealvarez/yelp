require 'rails_helper'

feature 'reviewing' do
  before {Restaurant.create name: 'KFC'}

  scenario 'allows users to leave a review using a form' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end


scenario 'where restaurant is deleted, reviews associated with the restaurant are also deleted' do

    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'
    visit '/restaurants'
    click_link 'Delete KFC'

    expect(current_path).to eq '/restaurants'
    expect(page).not_to have_content('Review KFC')
    expect(page).not_to have_content('Delete KFC')
  end

end
