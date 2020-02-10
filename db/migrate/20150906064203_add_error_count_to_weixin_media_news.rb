class AddErrorCountToWeixinMediaNews < ActiveRecord::Migration[5.1]
  def change
    add_column :weixin_media_news, :error_count, :integer
  end
end
