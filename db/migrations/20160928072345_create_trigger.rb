Hanami::Model.migration do
  change do
    create_table :triggers do
      primary_key :id
      column :type,      String,   null: false
      column :value,     String,   null: false, default: 1
    end

    alter_table :messages do
      # `users` table is implicit within this block, so it can be omitted.
      # add_column :email, String,  null: false, unique: true
      # set_column_default :visits_counts, default: 0
      add_foreign_key :trigger_id, :triggers, on_delete: :cascade
      drop_column :views
    end
  end
end
