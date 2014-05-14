class AddMemberStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :member_status, :string, default: "Member"
  end
end
