module EricWeixin
  class Engine < ::Rails::Engine
    isolate_namespace EricWeixin
    initializer "eric_weixin.assets.precompile" do |app|
    	app.config.assets.precompile += %w( eric_weixin/cms/base.js eric_weixin/cms/base.css eric_weixin/wz/base.css )
    end
  end
end