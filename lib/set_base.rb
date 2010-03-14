module SetBase
  def self.included(base)
    base.before_filter :set_base
  end
  
  def set_base
    ExpireCache::Baseclass.base = self
  end
end