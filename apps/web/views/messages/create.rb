module Web::Views::Messages
  class Create
    include Web::View

    def created
      if params.valid?
        html.div(class: 'alert alert-success', role: 'alert') do
          strong('Success!')
          span('Message was created here:')
          a(url, href: url, class: 'alert-link')
        end
      else
        html.p(params.errors.to_s)
      end
    end

    template 'messages/index'
  end
end
