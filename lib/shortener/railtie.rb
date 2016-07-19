require "rails/railtie"
require "shortener"

class Shortener::Railtie < ::Rails::Railtie #:nodoc:
  initializer "shortener.register.active.record.extension" do
    # This way of extending ActiveSupport breaks schema plus and makara; removing the autoload for now
    #ActiveSupport.on_load :active_record do
    #  extend Shortener::ActiveRecordExtension
    #end
    ActiveSupport.on_load :action_view do
      include Shortener::ShortenerHelper
    end
  end
end
