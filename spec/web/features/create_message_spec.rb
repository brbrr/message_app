require 'features_helper'

describe 'Messages' do
  after do
    MessageRepository.clear
  end

  it 'can create a new message' do
    visit '/'

    within 'form#message-form' do
      fill_in 'text', with: 'Hi there!'

      click_button 'send'
    end

    expect(current_path).not_to eq('/')
    expect(page).to have_text('Hi there!')
  end
end
