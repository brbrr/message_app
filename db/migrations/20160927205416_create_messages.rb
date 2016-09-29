Hanami::Model.migration do
  change do
    create_table :messages do
      primary_key :id
      column :text,      String,   null: false
      column :views,     String,   null: false, default: 0
      column :date_created, DateTime, default: DateTime.now
      column :date_updated, DateTime, default: DateTime.now
    end
  end
end
