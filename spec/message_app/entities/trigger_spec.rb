require 'spec_helper'

RSpec.describe Trigger do
  after do
    TriggerRepository.clear
  end

  context '#valid?' do
    it 'check expired triggers' do
      trigger = TriggerRepository.create(Trigger.new(type: 'hours'))
      trigger.created_at = DateTime.now - (2.0 / 24)
      expect(trigger).not_to be_valid
    end

    it 'validate views' do
      trigger = TriggerRepository.create(Trigger.new(type: 'views'))
      trigger_from_db = TriggerRepository.find(trigger.id)
      trigger_from_db.views += 1
      expect(trigger_from_db).not_to be_valid
    end
  end
end
