class AddRoleToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :role, default:0
    end
  end
end
