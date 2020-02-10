module WeixinController
  mattr_accessor :controller_inherit_class

  def self.controller_inherit_class
    @@controller_inherit_class.constantize
  end
end