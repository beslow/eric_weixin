class WeixinInstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_initializer_file
    copy_file "eric_weixin.rb", "config/initializers/eric_weixin.rb"
    copy_file "weixin_user.rb", "app/models/weixin/weixin_user.rb"
    copy_file "progress.rb", "app/models/weixin/progress.rb"
    copy_file "weixin_auto_reply_functions.rb", "app/models/weixin/weixin_auto_reply_functions.rb"
  end
end
