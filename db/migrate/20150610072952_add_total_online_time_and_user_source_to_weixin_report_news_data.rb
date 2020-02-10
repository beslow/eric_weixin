class AddTotalOnlineTimeAndUserSourceToWeixinReportNewsData < ActiveRecord::Migration[5.1]
  def change
    add_column :weixin_report_news_data, :total_online_time, :integer
    add_column :weixin_report_news_data, :user_source, :integer
  end
end
