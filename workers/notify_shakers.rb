require 'httparty'

require './lib/message_preparer'

class NotifyShakers
  include HTTParty

  base_uri 'https://hooks.slack.com'

  def perform(message)
    print "Posting your message to #{notify_endpoint}..."
    response = self.class.post(notify_endpoint, body: { text: message }.to_json)
    puts "done."

    raise "Sending message to Slack failed with response #{response.code}" unless response.success?
  end

  private

  def notify_endpoint
    ENV.fetch('ENDPOINT')
  end
end

NotifyShakers.new.perform(MessagePreparer.prepare)
