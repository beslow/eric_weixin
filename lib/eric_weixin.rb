require "eric_weixin/version"

require "foundation-rails"
require "will_paginate-foundation"
require "jquery-rails"
require "jquery-ui-rails"
require "rest-client"
require "tinymce-rails"
require "eric_weixin/engine"

require "eric_weixin/modules/model_treasure_chest"
require "eric_weixin/modules/tool"

require 'eric_weixin/modules/mult_customer'
require 'eric_weixin/modules/reply_message'
require 'eric_weixin/modules/snsapi'
require 'eric_weixin/modules/ip'
require 'eric_weixin/modules/analyze_data'
require 'eric_weixin/modules/pay'

class BusinessException < Exception
  def self.raise exception_message
    # $!.to_s.to_logger
    # $@.to_logger if $@
    Kernel.raise BusinessException, exception_message
  end
end

module EricWeixin

end
