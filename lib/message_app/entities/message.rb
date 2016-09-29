class Message
  include Hanami::Entity
  attributes :text, :trigger_id, :created_at, :updated_at

  def create_trigger(attrs)
    @trigger_id = TriggerRepository.create(Trigger.new(attrs)).id
  end

  def trigger
    TriggerRepository.find(@trigger_id)
  end
end
