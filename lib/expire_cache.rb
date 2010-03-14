# ExpireCache
module ExpireCache
  class Baseclass
    def initialize
      @@base = ""
    end
    
    def self.base= bas
      @@base = bas
    end
    
    def self.base
      @@base
    end
  end
  
  def expire_fragment_cache(options = {})
    if options.is_a?(Hash)
      if options.size == 1
        str = options[:controller].to_s + "/*.*"
        ExpireCache::Baseclass.base.expire_fragment(%r{#{str}})
      else
        ExpireCache::Baseclass.base.expire_fragment(options)
      end
    else
      ExpireCache::Baseclass.base.expire_fragment(options)
    end
  rescue
    logger.info("error: Expire Cache cannot expire the cache, might be due to request not being user request which has not initialized controllers.")
  end
  
  def expire_action_cache(options = {})
    ExpireCache::Baseclass.base.expire_action(options)
  rescue
    logger.info("error: Expire Cache cannot expire the cache, might be due to request not being user request which has not initialized controllers.")
  end
  
  def expire_page_cache(options = {})
    ExpireCache::Baseclass.base.expire_page(options)
  rescue
    logger.info("error: Expire Cache cannot expire the cache, might be due to request not being user request which has not initialized controllers.")
  end
end

# Author: Harish
# Email: p.harish86@gmail.com
# Blog: www.harish-in.blogspot.com, www.harishwords.wordpress.com