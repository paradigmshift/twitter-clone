class CreateMentions < ActiveRecord::Migration
  def change
    create_table :mentions do |t|
      t.integer :mention_id, :status_id
      t.timestamps
    end
  end
end
