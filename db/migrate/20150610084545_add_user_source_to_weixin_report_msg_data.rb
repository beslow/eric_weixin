class AddUserSourceToWeixinReportMsgData < ActiveRecord::Migration[5.1]
  def change
    add_column :weixin_report_msg_data, :user_source, :integer
  end
end
