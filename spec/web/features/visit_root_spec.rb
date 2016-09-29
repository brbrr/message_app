require 'features_helper'

describe 'Visit root' do
  it 'is successful' do
    visit '/'

    expect(page.body).to include 'Message'
  end
end
