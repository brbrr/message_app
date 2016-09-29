module Web::Views::Messages
  class Create
    include Web::View

    def created
      html.div(class:'alert alert-success alert-dismissible', role:'alert') do
        button(type: 'button', class: 'close', 'data-dismiss' => 'alert', 'aria-label' => 'Close') do
          span('&times;', 'aria-hidden' => 'true')
        end
        strong('Success!')
        span('Message was created here:')
        a(url, href: url, class: 'alert-link')
      end
    end
    
    template 'messages/index'
  end
end
