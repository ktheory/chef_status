class CreateChefReports < ActiveRecord::Migration
  def self.up
    create_table :chef_reports do |t|
      t.string :node
      t.boolean :success

      t.timestamps
    end

    add_index :chef_reports, :node, :unique => true
    add_index :chef_reports, :updated_at
  end

  def self.down
    drop_table :chef_reports
  end
end
