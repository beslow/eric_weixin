class AlertWeixinReplyMessageRulesSReplyMessageLength < ActiveRecord::Migration[5.1]
  def change
    change_column :weixin_reply_message_rules, :reply_message, :text
  end
end
