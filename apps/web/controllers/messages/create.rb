module Web::Controllers::Messages
  class Create
    include Web::Action

    params do
      required(:message).schema do
        required(:text).filled
      end

      required(:trigger).schema do
        required(:type).filled
        required(:value).filled(:int?)
      end
    end

    expose :message, :url

    def call(params)
      if params.valid?
        @message = Message.new(text: params[:message][:text])
        @message.create_trigger(type: params[:trigger][:type], value: params[:trigger][:value])
        @message = MessageRepository.create(@message)
        hshd_id = Hashids.new('message_app', 8).encode(@message.id)
        @url = routes.root_url + hshd_id
      else
        self.status = 422
      end
    end
  end
end
