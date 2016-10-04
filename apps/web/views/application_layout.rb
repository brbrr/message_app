module Web
  module Views
    class ApplicationLayout
      include Web::Layout

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

      def controller_name
        @scope.view.class.name.split('::')[2].downcase
      end

      def action_name
        @scope.view.class.name.split('::')[3].downcase
      end
    end
  end
end
