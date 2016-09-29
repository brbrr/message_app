require 'spec_helper'

RSpec.describe Message do
  it 'can be initialised with attributes' do
    message = Message.new(text: 'Hi there!')
    expect(message.text).to eq 'Hi there!'
  end
end
