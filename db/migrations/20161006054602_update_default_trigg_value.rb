Hanami::Model.migration do
  change do
    alter_table :triggers do
      set_column_default :value, 1
    end
  end
end
