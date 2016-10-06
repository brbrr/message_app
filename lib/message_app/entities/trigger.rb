class Trigger
  include Hanami::Entity
  attributes :type, :value, :created_at, :updated_at

  def expired?
    # Check if it was created more then 1h ago (1.0 - is a hour)
    return @created_at < (Time.now - (@value * 60 * 60)) if @type == 'hours'
    return @value < 1 if @type == 'views'
  end
end
