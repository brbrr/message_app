module Web::Controllers::Messages
  class Show
    include Web::Action

    params do
      required(:id).filled
    end

    expose :message

    def call(params)
      id = Hashids.new('message_app', 8).decode(params[:id].to_s)[0]
      @message = MessageRepository.find(id)
      trigger = @message.trigger
      if trigger.expired?
        self.body = Web::Views::Messages::Expired.render(format: :html)
        return
      end
      TriggerRepository.update_counters(trigger)
    end
  end
end
