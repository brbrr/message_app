require 'spec_helper'

RSpec.describe Trigger do
  after do
    TriggerRepository.clear
  end

  context '#expired?' do
    it 'check expired triggers' do
      trigger = TriggerRepository.create(Trigger.new(type: 'hours', value: 0))
      trigger.created_at = Time.now - (3 * 60 * 60)
      expect(trigger).to be_expired
    end

    it 'validate views' do
      trigger = TriggerRepository.create(Trigger.new(type: 'views', value: 1))
      trigger_from_db = TriggerRepository.find(trigger.id)
      trigger_from_db.value -= 1
      expect(trigger_from_db).to be_expired
    end
  end
end
