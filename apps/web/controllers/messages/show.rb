module Web::Controllers::Messages
  class Show
    include Web::Action

    expose :message

    def call(params)
      id = Hashids.new('message_app', 8).decode(params[:id].to_s)[0]
      @message = MessageRepository.find(id)
      trigger = @message.trigger
      unless trigger.valid?
        self.body = Web::Views::Messages::Expired.render(format: :html)
      end
      trigger.views += 1
      TriggerRepository.update(trigger)
    end
  end
end
