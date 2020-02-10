class AddIndexToWeixinMessageLogs < ActiveRecord::Migration[5.1]
  def change
  	add_index :weixin_message_logs, :message_id
  	add_index :weixin_message_logs, :create_time
  	add_index :weixin_message_logs, :created_at
  end
end