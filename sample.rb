require "slack-notify"
require 'clockwork'
require 'active_support/time'
require 'dotenv'

include Clockwork

Dotenv.load('./.env')

module Clockwork
    handler do |job|
        puts "Running #{job}"
    end

    every(1.seconds, 'job') do
        client = SlackNotify::Client.new(
            webhook_url: ENV['URL'],
            channel: "#general",
            username: "mybot",
            icon_url: "http://mydomain.com/myimage.png",
            icon_emoji: ":shipit:",
            link_names: 1
            )
            client.notify("投稿成功！！！！")
    end
end