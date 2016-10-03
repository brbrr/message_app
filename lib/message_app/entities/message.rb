class Message
  include Hanami::Entity
  extend AttrEncrypted

  attributes :text, :trigger_id, :created_at, :updated_at
  attr_encrypted :text, key: 'This is a key that is 256 bits!!', encode: true

  def create_trigger(attrs)
    @trigger_id = TriggerRepository.create(Trigger.new(attrs)).id
  end

  def trigger
    TriggerRepository.find(@trigger_id)
  end
end
