class AddUnionidToWeixinUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :weixin_users, :unionid, :string
  end
end
