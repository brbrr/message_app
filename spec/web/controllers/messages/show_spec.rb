require_relative '../../../../apps/web/controllers/messages/show'

RSpec.describe Web::Controllers::Messages::Show do
  let(:action) { described_class.new }

  before do
    MessageRepository.clear
    params = Hash[message: { text: 'Hi there!' }, trigger: { type: 'views', value: 3 }]
    mess = create_message(params)
    @id = mess.id
  end

  it 'show created message' do
    hshd_id = Hashids.new('message_app', 8).encode(@id)
    action.call(id: hshd_id)
    expect(action.message.id).to eq @id
  end

  it 'return correct status' do
    hshd_id = Hashids.new('message_app', 8).encode(@id)
    response = action.call(id: hshd_id)

    expect(response[0]).to eq 200
  end

  it 'update views counter for not expired Trigger' do
    params = Hash[message: { text: 'Hi there!' }, trigger: { type: 'views', value: 3 }]
    mess = create_message(params)
    hshd_id = Hashids.new('message_app', 8).encode(mess.id)
    action.call(id: hshd_id)
    tr = TriggerRepository.find(mess.trigger_id)
    expect(tr.value).to eq 2

    action.call(id: hshd_id)
    tr = TriggerRepository.find(mess.trigger_id)
    expect(tr.value).to eq 1

    action.call(id: hshd_id)
    tr = TriggerRepository.find(mess.trigger_id)
    expect(tr.value).to eq 0
  end

  it 'not update views counter for expired Trigger' do
    params = Hash[message: { text: 'Hi there!' }, trigger: { type: 'views', value: -3 }]
    mess = create_message(params)
    hshd_id = Hashids.new('message_app', 8).encode(mess.id)
    action.call(id: hshd_id)
    tr = TriggerRepository.find(mess.trigger_id)
    expect(tr.value).to eq(-3)
  end

  it 'render Expired view for expired trigger(by views)' do
    params = Hash[message: { text: 'Hi there!' }, trigger: { type: 'views', value: 0 }]
    mess = create_message(params)
    hshd_id = Hashids.new('message_app', 8).encode(mess.id)
    resp = action.call(id: hshd_id)
    expect(resp[2][0]).to include 'You trying to view deleted message!'
  end

  it 'render Expired view for expired trigger(by hours)' do
    params = Hash[message: { text: 'Hi there!' }, trigger: { type: 'hours', value: 0 }]
    mess = create_message(params)
    hshd_id = Hashids.new('message_app', 8).encode(mess.id)
    resp = action.call(id: hshd_id)
    expect(resp[2][0]).to include 'You trying to view deleted message!'
  end
end
