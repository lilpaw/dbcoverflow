require 'httparty'

class GithubAdapter

  include HTTParty

  base_uri "https://api.github.com"
  basic_auth ENV['BF_USERNAME'], ENV['BF_PASSWORD']

  def initialize
    @client_id = ENV['CLIENT_ID']
    @client_secret = ENV['CLIENT_SECRET']
  end

  def zen
    self.class.get("/zen")
  end

end
