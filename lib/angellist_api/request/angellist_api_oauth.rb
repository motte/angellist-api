require 'faraday'

module AngellistApi
  module Request
    class AngellistApiOAuth < Faraday::Middleware
      def call(env)
        env[:request_headers]['Authorization'] = "Bearer #{@options[:access_token]}" if @options[:access_token]
        @app.call(env)
      end

      def initialize(app, options)
        @app, @options = app, options
      end
    end
  end
end
