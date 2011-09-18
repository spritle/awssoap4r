require 'rubygems'
require 'savon'
require 'hmac'
require 'hmac-sha2'
require 'base64'
require 'pp'


module Aws
	class Consumer
		@@url = "http://webservices.amazon.com/AWSECommerceService/AWSECommerceService.wsdl"
		def initialize(aws_access_key_id, aws_secret_key, sIndex, keyword)
			@aws_access_key_id = aws_access_key_id
			@aws_secret_key = aws_secret_key
			@search_index = sIndex
			@keyword = keyword
			@client = Savon::Client.new(@@url)
		end
		
		def timestamp_and_signature(operation)
			timestamp = Time.now.gmtime.iso8601
			hmac = HMAC::SHA256.new(@aws_secret_key)
			hmac.update("#{operation}#{timestamp}")
			# chomp to get rid of the newline
			signature = Base64.encode64(hmac.digest).chomp
			[timestamp, signature]
		end
	
		
		def search
			operation = "ItemSearch"
			timestamp, signature = timestamp_and_signature(operation)
			@client.request :item_search do |soap|
			soap.body= {
			"Request" => {"Keywords" => @keyword, "SearchIndex" => @search_index},
			"AssociateTag" => 'Keywords',
			"Timestamp" => timestamp,
			"AWSAccessKeyId" => @aws_access_key_id,
			"Signature" => signature
			}
		end
	end		
	end
end
