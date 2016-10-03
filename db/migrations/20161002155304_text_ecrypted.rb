Hanami::Model.migration do
  change do
    alter_table :messages do
      rename_column :text, :encrypted_text
    end
  end
end
