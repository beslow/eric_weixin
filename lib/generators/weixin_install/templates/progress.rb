class ::Weixin::Process
  #用户订阅回调
  # options[:EventKey]
  def self.subscribe options, is_new
    "subscribe.......".to_logger
    true
  end

  #用户取消订阅回调
  def self.unsubscribe options
    "unsubscribe.......".to_logger
    true
  end

  #用户点击回调
  def self.click_event event_key, options
    "click_event.......".to_logger
    true
  end

  #模板消息回调，不关心返回值。
  def self.template_send_job_finish options
    ''
  end

  #用户发送过来消息，回调,只要这里不返回true，则Gem中的值不会被返回。以这里优先级最高。
  def self.text_event content, options
    # if content == '你好'
    #   EricWeixin::MultCustomer.send_customer_service_message weixin_number: options[:ToUserName],
    #                                                          openid: options[:FromUserName],
    #                                                          message_type: 'text',
    #                                                          data: {:content => '你好，你好！'},
    #                                                          message_id: options[:MsgId]
    #
    #   return ''
    # elsif content == '我要找客服。'
    #
    #   return ''
    # end
    true
  end

  def self.image_event content, options
    true
  end

  #浏览事件
  def self.view_event content, options
    true
  end

  #其它事件回调
  def self.another_event options
    true
  end

  #用户自动上报地理位置信息
  def self.auto_location_event options
    true
  end

  def self.scan_event content, options
    true
  end

  #获取到经纬度
  def self.location_event options
    ''
  end

  # 订单通知
  def self.get_merchant_order options
    # ::Weixin::Process.delay(:priority => 10).order_tongzhi(options[:OrderId], options)
    true
  end

  #链接消息
  def self.link_event options
    ''
  end

  #客服会话结束
  # 这里可用于让用户给客服打分等。
  def self.kv_close_session options
    true
  end

  #客服开始
  def self.kv_create_session options
    true
  end

  def self.message_send_job_finish options
    true
  end
end