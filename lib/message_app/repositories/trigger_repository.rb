class TriggerRepository
  include Hanami::Repository

  def self.update_counters(trigger)
    trigger.value -= 1 if trigger.type == 'views'
    update(trigger)
  end
end
