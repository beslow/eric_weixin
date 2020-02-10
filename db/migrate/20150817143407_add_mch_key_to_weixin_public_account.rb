class AddMchKeyToWeixinPublicAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :weixin_public_accounts, :mch_key, :string
  end
end
