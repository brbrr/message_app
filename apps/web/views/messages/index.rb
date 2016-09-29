module Web::Views::Messages
  class Index
    include Web::View

    def radio_btn(radio_name, text_value)
      html.div(class: 'radio') do
        html.label do
          input name: radio_name, type: 'radio', value: radio_name
          text text_value
        end
      end
    end

  end
end
