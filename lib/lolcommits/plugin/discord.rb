# frozen_string_literal: true

require 'lolcommits/plugin/base'
require 'discordrb/webhooks'

module Lolcommits
  module Plugin
    class Discord < Base

      # Number of times to retry if RestClient.post fails
      RETRY_COUNT = 1

      ##
      # Capture ready hook, runs after lolcommits captures a snapshot.
      #
      def run_capture_ready
        retries = RETRY_COUNT
        begin
          print "Posting to Discord ... "

          client = Discordrb::Webhooks::Client.new(url: configuration[:webhook])
          response = client.execute do |builder|
            builder.content = "[#{runner.vcs_info.repo}]\n> ```#{runner.message}```"
            builder.file = File.new(runner.lolcommit_path)
          end

          debug response
          print "done!\n"
        rescue => e
          print "failed! #{e.message}"
          if retries > 0
            retries -= 1
            print " - retrying ...\n"
            retry
          else
            print " - giving up ...\n"
            puts 'Try running config again:'
            puts "\tlolcommits --config -p discord"
          end
        end
      end

      ##
      # Prompts the user to configure integration with Discord
      #
      # Prompts user for a Discord webhook URL
      #
      # @return [Hash] a hash of configured plugin options
      #
      def configure_options!
        options = super

        if options[:enabled]
          print "enter your Discord webhook URL below, then press enter: (e.g. https://discord.com/api/webhooks/1234/xxxx-xx-xxxxx) \n"
          webhook_url = parse_user_input(gets.strip)

          options.merge!(
            webhook: webhook_url,
          )
        end

        options
      end
    end
  end
end
