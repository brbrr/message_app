Hanami::Model.migration do
  change do
    alter_table :messages do
      set_column_type :created_at, Time
      set_column_type :updated_at, Time
    end
  end
end
