require 'features_helper'

describe 'Show message text' do
  before do
    MessageRepository.clear
    mess = MessageRepository.create(Message.new(text: 'Hi there!'))
    @id = mess.id
  end

  it 'is successful' do
    hshd_id = Hashids.new('message_app', 8).encode(@id)
    visit "/#{hshd_id}"

    expect(page.body).to include 'Hi there!'
  end
end
