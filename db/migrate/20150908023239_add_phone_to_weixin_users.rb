class AddPhoneToWeixinUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :weixin_users, :phone, :string
  end
end
