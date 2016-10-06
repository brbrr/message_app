RSpec.describe TriggerRepository do
  after do
    TriggerRepository.clear
  end

  context '.update_counters' do
    it 'increments value for views trigger' do

      trigger = TriggerRepository.create(Trigger.new(type: 'hours', value: 0))

      trigger.type = 'views'
      trigger.value = 3
      TriggerRepository.update_counters(trigger)
      trigger = TriggerRepository.find(trigger.id)
      expect(trigger.value).to eq 2
    end

    it 'ignores hours tirgger' do
      trigger = TriggerRepository.create(Trigger.new(type: 'hours', value: 0))

      TriggerRepository.update_counters(trigger)
      trigger = TriggerRepository.find(trigger.id)
      expect(trigger.value).to eq 0
    end

    it 'saves trigger to db' do
      trigger = TriggerRepository.create(Trigger.new(type: 'hours', value: 0))

      updated_at = trigger.updated_at
      TriggerRepository.update_counters(trigger)
      trigger = TriggerRepository.find(trigger.id)
      expect(trigger.updated_at).to be > updated_at
    end
  end
end
