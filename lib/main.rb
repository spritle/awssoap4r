require 'lib/aws/consumer'			

def get_index_keyword(index_keyword)
	sIndex_keyword_arr = index_keyword.split(',')
	sIndex = sIndex_keyword_arr.first
	sIndex_keyword_arr.delete_at(0)
	[sIndex, sIndex_keyword_arr.join(',')]
end

p "Please Enter the aws_secret_key"
secret = gets.strip
p "Please Enter aws_access_key_id"
access = gets.strip
p "Please Enter search index with keywords seperated by comma"
sIndex_keyword = gets.strip
sIndex, keyword = get_index_keyword(sIndex_keyword)
p "Secret is : #{secret} Access Key is #{access} with SearchIndex as : #{sIndex} with Keyword : #{keyword}"
if secret && access != ""

amazon_ws = Aws::Consumer.new(secret, access, sIndex, keyword )
results = amazon_ws.search()
puts results.to_hash[:item_search_response][:items][:item]
end




