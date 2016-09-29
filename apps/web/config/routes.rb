# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
get '/:id', to: 'messages#show'
post '/', to: 'messages#create'
root to: 'messages#index'

# resource :messages, only: [:show, :edit, :update, :destroy]
