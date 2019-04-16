class CreateIds < ActiveRecord::Migration[5.2]
  def up
    create_table :ids do |t|
      t.string :uuid
      t.timestamps
    end
  end
  def down
    drop_table :ids
  end
end
