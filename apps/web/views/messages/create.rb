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
        html.div(class: 'alert alert-danger', role: 'alert') do
          strong('Please fix the errors:')
          ul(class: 'list-unstyled errors') do
            params.error_messages.each { |error| li(error) }
          end
        end
      end
    end

    template 'messages/index'
  end
end
