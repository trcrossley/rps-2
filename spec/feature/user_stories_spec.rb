require 'spec_helper'

# As a marketeer
# So that I can see my name in lights
# I would like to register my name before playing an online game

feature 'Register a name' do
  scenario 'Registers and displays name' do
    visit '/'
    fill_in('name', with: 'Tristan')
    click_button 'Submit'
    expect(page).to have_content('Tristan')
  end
end

# As a marketeer
# So that I can enjoy myself away from the daily grind
# I would like to be able to play rock/paper/scissors

feature 'Playing a game' do
  before do
    visit '/'
    fill_in('name', with: 'Tristan')
    click_button('Submit')
    expect(page).to have_content('Tristan')
  end

  scenario 'See weapon choices' do
    expect(page).to have_button 'Rock'
    expect(page).to have_button 'Paper'
    expect(page).to have_button 'Scissors'
  end

  scenario 'Select a weapon' do
    click_button('Paper')
    expect(page).to have_content('You have selected Paper!')
  end

  scenario 'Computer selects a weapon' do
    click_button('Rock')

    message = find(:css, "#computer").text

    expect(possible_messages).to include message
  end

  def possible_messages
    [:rock, :paper, :scissors].map { |weapon| "Computer has selected #{weapon.to_s.capitalize}!"}
  end
end
