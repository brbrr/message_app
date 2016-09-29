require 'spec_helper'
require_relative '../../../../apps/web/controllers/messages/create'

RSpec.describe Web::Controllers::Messages::Create do
  let(:action) { described_class.new }
  let(:params) { Hash[text: 'Hi there!'] }

  before do
    MessageRepository.clear
  end

  it 'creates a new message' do
    action.call(params)

    expect(action.message.id).not_to be_nil
    expect(action.message.text).to eq params[:text]
  end

  it 'redirects the user to the created message' do
    response = action.call(params)

    expect(response[0]).to eq 302
    hshd_id = Hashids.new('message_app', 8).encode(action.message.id)
    expect(response[1]['Location']).to eq "/#{hshd_id}"
  end
end
