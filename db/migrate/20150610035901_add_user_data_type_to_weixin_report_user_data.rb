class AddUserDataTypeToWeixinReportUserData < ActiveRecord::Migration[5.1]
  def change
    add_column :weixin_report_user_data, :user_data_type, :string
  end
end
