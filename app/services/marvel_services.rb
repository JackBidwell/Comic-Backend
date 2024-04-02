require 'httparty'
require 'digest/md5'

class MarvelService
  include HTTParty
  base_uri 'https://gateway.marvel.com:443/v1/public'

  def initialize
    @public_key = ENV['MARVEL_PUBLIC_KEY']
    @private_key = ENV['MARVEL_PRIVATE_KEY']
    @ts = Time.now.to_i.to_s
    @hash = Digest::MD5.hexdigest(@ts + @private_key + @public_key)
  end

  def comics
    self.class.get('/comics', query: default_params)
  end

  private

  def default_params
    {
      ts: @ts,
      apikey: @public_key,
      hash: @hash
    }
  end
end
