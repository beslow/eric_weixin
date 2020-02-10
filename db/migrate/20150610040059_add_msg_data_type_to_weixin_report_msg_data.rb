class AddMsgDataTypeToWeixinReportMsgData < ActiveRecord::Migration[5.1]
  def change
    add_column :weixin_report_msg_data, :msg_data_type, :string
  end
end
