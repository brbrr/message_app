class Trigger
  include Hanami::Entity
  attributes :type, :views, :created_at, :updated_at

  def valid?
    # Check if it was created more then 1h ago (1.0 - is a hour)
    return @created_at > (DateTime.now - (1.0 / 24)) if @type == 'hours'
    return @views < 1 if @type == 'views'
  end
end
