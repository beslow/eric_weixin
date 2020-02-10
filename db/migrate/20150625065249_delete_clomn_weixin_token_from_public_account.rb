class DeleteClomnWeixinTokenFromPublicAccount < ActiveRecord::Migration[5.1]
  def change
    remove_column :weixin_public_accounts, :weixin_token
  end
end
