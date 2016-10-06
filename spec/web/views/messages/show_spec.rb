require_relative '../../../../apps/web/views/messages/show'

RSpec.describe Web::Views::Messages::Show do
  let(:exposures) { Hash[message: message] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/messages/show.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }
  let(:message)   { create_message(params) }
  let(:params)    { Hash[message: { text: 'Hi there!' }, trigger: { type: 'views', value: 3 }] }

  it 'exposes #foo' do
    # expect(view.foo).to eq exposures.fetch(:foo)
  end
end
