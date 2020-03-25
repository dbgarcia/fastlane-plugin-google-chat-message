require 'fastlane/action'
require_relative '../helper/google_chat_message_helper'
require 'net/http'
require 'uri'
require 'json'

module Fastlane
  module Actions
    class GoogleChatMessageAction < Action
      def self.run(params)

        uri = URI.parse(params[:webhook])

        bodyText = { text: params[:text] }

        # Create the HTTP objects
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER
        request = Net::HTTP::Post.new(uri.request_uri)
        request.body = bodyText.to_json
        
        # Send the request
        response = http.request(request)

        UI.message("✅ Message sent!")
        UI.message("✅ The google_chat_message plugin is working! 🎉")

      end

      def self.description
        "Send simple text messages to Google Chat"
      end

      def self.authors
        ["Douglas Garcia"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Send simple text messages to Google Chat rooms"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :text,
                                  env_name: "GOOGLE_CHAT_MESSAGE_text",
                               description: "A basic message that specifies just a simple plaintext body",
                                  optional: false,
                                      type: String),

          FastlaneCore::ConfigItem.new(key: :webhook,
                                  env_name: "GOOGLE_CHAT_MESSAGE_webhook",
                               description: "Webhook",
                                  optional: false,
                                      type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
