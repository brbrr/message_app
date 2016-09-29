Hanami::Model.migration do
  change do
    alter_table :triggers do
      drop_column :value
      add_column :created_at, DateTime
      add_column :updated_at, DateTime
      add_column :views, Integer, default: 0
    end

    alter_table :messages do
      drop_column :date_created
      drop_column :date_updated
      add_column :created_at, DateTime
      add_column :updated_at, DateTime
    end
  end
end
