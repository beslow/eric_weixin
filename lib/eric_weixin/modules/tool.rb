class Array
  def to_logger
    self.each { |item|
      ((item||'').to_s).to_logger
    }
  end

  def to_debug
    self.each { |item|
      #next if item.class==String and item.include? '/1.8/'
      ((item||'').to_s).to_debug
    }
  end

  alias :to_info :to_logger
end

class Time
  def chinese_format
    self.strftime("%Y-%-m-%-d %H:%M:%S")
  end
  def chinese_format_day
    self.strftime("%Y-%-m-%-d")
  end
  def chinese_week_day
    cwdays = %w{星期一 星期二 星期三 星期四 星期五 星期六 星期日}
    cwdays[self.to_date.cwday-1]
  end
end
class Date
  def chinese_format
    self.strftime("%Y-%-m-%-d 00:00:00")
  end
  def chinese_format_day
    self.strftime("%Y-%-m-%-d")
  end
  def chinese_week_day
    cwdays = %w{星期一 星期二 星期三 星期四 星期五 星期六 星期日}
    cwdays[self.cwday-1]
  end
end


class DateTime
  def chinese_format
    self.strftime("%Y-%-m-%-d %H:%M:%S")
  end
  def chinese_format_day
    self.strftime("%Y-%-m-%-d")
  end
end

class Hash
  def to_logger
    self.each_pair { |k, v|
      info1 = ''
      info1 << ((k||'').to_s rescue '') <<":" << ((v||'').to_s rescue '') << "\n"
      ApplicationController.logger.info info1
    }
  end

  def to_debug
    self.each_pair { |k, v|
      info1 = ''
      info1 << ((k||'').to_s rescue '') <<":" << ((v||'').to_s rescue '') << "\n"
      ApplicationController.logger.debug info1
    }
  end

  alias :to_info :to_logger
end

class NilClass
  def to_logger
    'nil'.to_logger
  end

  def to_debug
    'nil'.to_debug
  end

  alias :to_info :to_logger
end

class Symbol
  def to_logger
    self.to_s.to_logger
  end

  def to_debug
    self.to_s.to_debug
  end

  alias :to_info :to_logger
end

class String

  def to_logger
    ApplicationController.logger.info self
    ApplicationController.logger.info "\n"
  end

  def to_debug
    ApplicationController.logger.debug self
    ApplicationController.logger.debug "\n"
  end

  alias :to_info :to_logger
end