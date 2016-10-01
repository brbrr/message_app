module Web
  module Views
    class ApplicationLayout
      include Web::Layout

      def radio_btn(radio_name, text_value)
        html.div(class: 'form-group') do
          div(class: 'radio') do
            label do
              input(name: :trigger, type: 'radio', value: radio_name)
              text(text_value)
            end
          end
        end
      end
    end
  end
end
