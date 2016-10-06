Hanami::Model.migration do
  change do
    alter_table :triggers do
      set_column_type :created_at, Time
      set_column_type :updated_at, Time
    end
  end
end
