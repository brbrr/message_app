Hanami::Model.migration do
  change do
    alter_table :messages do
      add_column :encrypted_text_iv, String
    end
  end
end
