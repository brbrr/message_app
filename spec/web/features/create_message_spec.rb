require 'features_helper'

describe 'Messages' do
  after do
    MessageRepository.clear
  end

  it 'can create a new message' do
    visit '/'

    within 'form#message-form' do
      fill_in 'message-text', with: 'Hi there!'
      fill_in 'message-value', with: '2'
      choose('Expire by views')
      click_button 'Send message'
    end

    expect(current_path).to eq('/')
    expect(page).to have_text('Success! Message was created here')
  end
end
