class EricWeixin::Cms::BaseController < WeixinController.controller_inherit_class

  helper_method :set_notice, :get_notice, :get_notice_str

  before_action :clear_notice

  def clear_notice
    session[:notice] = nil
  end

  require 'pp'
  #处理控制器中的异常信息。
  def dispose_exception e
    case e
      when ::BusinessException
        set_notice e.to_s
        return e.to_s
      when ActiveRecord::RecordInvalid #对于模型中的字段校验，则返回一个hash，分别是字段所对应的错误信息。
        errors = ''
        e.record.errors.each do |k, v|
          errors = v
          break
          # errors += "     #{v}              ;"
        end
        set_notice errors
        return errors
      when ActiveRecord::RecordNotFound
        # e.to_s.to_logger
        # $@.to_logger
        set_notice '记录未被找到'
        return '记录未被找到'
      else
        # e.to_s.to_logger
        # $@.to_logger
        set_notice "貌似有一些问题，请联系系统管理员，微信 mbeslow, 报错：   #{e.to_s}"
        return "貌似有一些问题，请联系系统管理员，微信 mbeslow, 报错：   #{e.to_s}"
    end
  end

  def set_notice str
    session[:notice] = str
  end

  def get_notice
    str = session[:notice]
    session[:notice] = nil
    str
  end

  def get_notice_str is_all=true
    pp "session[:notice]", session[:notice]
    if session[:notice].class == String
      str = session[:notice]
      # session[:notice] = nil
      return str if str.present?
    end
    if is_all
      return str if not str.blank?
      h = get_notice_hash
      if h.values.length>0
        return h.values[0]
      end
    else
      return str
    end
  end

  def get_notice_hash
    if session[:notice].class == Hash
      str = session[:notice]
      session[:notice] = nil
      str
    else
      Hash.new('')
    end
  end

end
