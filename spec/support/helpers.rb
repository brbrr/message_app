def create_message(params)
  mess = Message.new(params[:message])
  mess.create_trigger(params[:trigger])
  mess = MessageRepository.create(mess)
end
