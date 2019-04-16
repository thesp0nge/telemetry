class CreateLogs < ActiveRecord::Migration[5.2]
  def up
    create_table :logs do |t|
      t.string :uuid
      t.string :ip
      t.string :kb_version
      t.string :message
      t.timestamps
    end

  end
  def down
    drop_table :logs
  end

end
