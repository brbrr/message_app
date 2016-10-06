require 'spec_helper'
require_relative '../../../../apps/web/controllers/messages/create'

RSpec.describe Web::Controllers::Messages::Create do
  let(:action) { described_class.new }
  let(:params) { Hash[message: { text: 'Hi there!' }, trigger: { type: 'views', value: 1 }] }

  before do
    MessageRepository.clear
  end

  it 'creates a new message together with linked trigger' do
    action.call(params)

    expect(action.message.id).not_to be_nil
    expect(action.message.text).to eq params[:message]['text']

    trigger = TriggerRepository.find(action.message.trigger_id)
    expect(trigger.type).to eq params[:trigger]['type']
    expect(trigger.value).to eq params[:trigger]['value'].to_i
  end

  it 'exposing url with hashed message id' do
    action.call(params)

    hshd_id = Hashids.new('message_app', 8).encode(action.message.id)
    expect(action.url).to include "/#{hshd_id}"
  end

  it 'exposing messsage together with trigger_id' do
    action.call(params)

    expect(action.message.trigger_id).to be > 0
  end

  it 'return 422 when params is not valid' do
    r = action.call(Hash[])

    expect(r[0]).to eq 422
  end

  context 'invalidate params' do
    it 'when :message is missing' do
      params.delete(:message)
      action.call(params)

      expect(action.params.error_messages).to include 'Message is missing'
    end

    it 'when :trigger is missing' do
      params.delete(:trigger)
      action.call(params)

      expect(action.params.error_messages).to include 'Trigger is missing'
    end

    it 'when message.text is missing' do
      params[:message].delete(:text)
      action.call(params)

      expect(action.params.error_messages).to include 'Text is missing'
    end

    it 'when message.text is empty' do
      params[:message][:text] = ''
      action.call(params)

      expect(action.params.error_messages).to include 'Text must be filled'
    end

    it 'when trigger.type is missing' do
      params[:trigger].delete(:type)
      action.call(params)

      expect(action.params.error_messages).to include 'Type is missing'
    end

    it 'when trigger.type is empty' do
      params[:trigger][:type] = ''
      action.call(params)

      expect(action.params.error_messages).to include 'Type must be filled'
    end

    it 'when trigger.value is missing' do
      params[:trigger].delete(:value)
      action.call(params)

      expect(action.params.error_messages).to include 'Value is missing'
    end

    it 'when trigger.value is string' do
      params[:trigger][:value] = 'some string'
      action.call(params)

      expect(action.params.error_messages).to include 'Value must be an integer'
    end

    it 'when trigger.value is less then 1' do
      params[:trigger][:value] = -(1 + rand * 100).to_i
      action.call(params)

      expect(action.params.error_messages).to include 'Value must be greater than 0'
    end

    it 'when trigger.value is 0' do
      params[:trigger][:value] = 0
      action.call(params)

      expect(action.params.error_messages).to include 'Value must be greater than 0'
    end
  end
end
