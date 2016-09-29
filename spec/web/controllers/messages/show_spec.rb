require_relative '../../../../apps/web/controllers/messages/show'

RSpec.describe Web::Controllers::Messages::Show do
  let(:action) { described_class.new }

  before do
    MessageRepository.clear
    mess = MessageRepository.create(Message.new(text: 'Hi there!'))
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
end
