module EricWeixin
  class Engine < ::Rails::Engine
    isolate_namespace EricWeixin
    initializer "eric_weixin.assets.precompile" do |app|
    	app.config.assets.precompile += %w( cms/base.js )
    	app.config.assets.precompile += %w( cms/base.css.scss )
    	app.config.assets.precompile += %w( wz/base.css )
    end
  end
end
