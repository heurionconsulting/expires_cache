# Include hook code here
ActiveRecord::Base.send :include, ExpireCache
ActionController::Base.send :include, ExpireCache
ActionController::Base.send :include, SetBase