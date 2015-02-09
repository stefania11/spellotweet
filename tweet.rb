require 'twitter'
require 'after_the_deadline'
AfterTheDeadline(nil, nil)
config = {
  consumer_key:    "your key here",
  consumer_secret: "your key here",
}
client = Twitter::REST::Client.new(config)
def correct_tweet_to(client,username)
  client.search("to:#{username}", result_type: "recent").take(1).each do |tweet|
    text = tweet.text
    errors = AfterTheDeadline.check(text)
    puts text
    puts errors
  end
end

correct_tweet_to(client, "Stefania_druga")
