# Usage: in develoopment.rb
#
#   config.middleware.insert_before Rails::Rack::Logger, DisableAssetsLogger
#
class DisableAssetsLogger
  def initialize(app)
    @app = app
    #CB was /dev/null but changed as this doesn't work on Windows
    Rails.application.assets.logger = Logger.new('logger.txt')
  end

  def call(env)
    previous_level = Rails.logger.level
    Rails.logger.level = Logger::ERROR if env['PATH_INFO'].index("/assets/") == 0
    @app.call(env)
  ensure
    Rails.logger.level = previous_level
  end
end
Rails.application.config.middleware.insert_before Rails::Rack::Logger, DisableAssetsLogger if Rails.env.development?