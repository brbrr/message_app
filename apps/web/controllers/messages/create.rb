module Web::Controllers::Messages
  class Create
    include Web::Action

    expose :message, :url, :trigger

    def call(params)
      @message = Message.new(text: params[:message][:text])
      @message.create_trigger(type: params[:message][:trigger], value: params[:message][:value])
      @message = MessageRepository.create(@message)
      hshd_id = Hashids.new('message_app', 8).encode(@message.id)
      @url = routes.root_url + hshd_id
    end
  end
end
