module Web
  module Views
    class ApplicationLayout
      include Web::Layout

      def radio_btn(radio_name, text_value)
        html.div(class: 'form-group') do
          div(class: 'radio') do
            label do
              input(name: 'trigger[type]', type: 'radio', value: radio_name)
              text(text_value)
            end
          end
        end
      end

      def radio_group
        html.div(class: 'btn-group', 'data-toggle' => 'buttons') do
          label(class: 'btn btn-primary') do
            input(name: 'trigger[type]', type: 'radio', autocomplete: 'off', value: :views)
            text('Expire by views')
          end
          label(class: 'btn btn-primary') do
            input(name: 'trigger[type]', type: 'radio', autocomplete: 'off', value: :hours)
            text('Expire by timeout')
          end
        end
      end
    end
  end
end
