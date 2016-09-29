require 'hanami/model'
require 'hanami/mailer'
require 'hashids'

Dir["#{ __dir__ }/message_app/**/*.rb"].each { |file| require_relative file }

Hanami::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * File System adapter
  #    adapter type: :file_system, uri: 'file:///db/bookshelf_development'
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/message_app_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/message_app_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/message_app_development'
  #    adapter type: :sql, uri: 'mysql://localhost/message_app_development'
  #
  adapter type: :sql, uri: ENV['DATABASE_URL']

  ##
  # Migrations
  #
  migrations 'db/migrations'
  schema     'db/schema.sql'

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  mapping do
    collection :messages do
      entity     Message
      repository MessageRepository

      attribute :id,            Integer
      attribute :text,          String
      attribute :trigger_id,    Integer
      attribute :created_at,    DateTime
      attribute :updated_at,    DateTime
    end

    collection :triggers do
      entity     Trigger
      repository TriggerRepository

      attribute :id,            Integer
      attribute :type,          String
      attribute :views,         Integer
      attribute :created_at,    DateTime
      attribute :updated_at,    DateTime
    end
  end
end.load!

Hanami::Mailer.configure do
  root "#{ __dir__ }/message_app/mailers"

  # See http://hanamirb.org/guides/mailers/delivery
  delivery do
    development :test
    test        :test
    # production :smtp, address: ENV['SMTP_PORT'], port: 1025
  end
end.load!
