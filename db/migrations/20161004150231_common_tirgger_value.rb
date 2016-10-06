Hanami::Model.migration do
  change do
    alter_table :triggers do
      rename_column :views, :value
    end
  end
end
