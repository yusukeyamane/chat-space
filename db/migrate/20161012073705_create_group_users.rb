class CreateGroupUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :group_users do |t|
      t.references :group, index: true
      t.references :user, index: true
    end
  end
end
