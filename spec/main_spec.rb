require 'spec_helper'

describe Aws::Consumer do

	before :all do
	@amazon_ws = Aws::Consumer.new("abcd", "xxxx", "Books", "searching the book")
	@amazon_ws.expects(:search).returns(23)
	end

	it "should match aws key" do
		@amazon_ws.aws_access_key_id.should == "abcd"
	end

	it "should match aws secret" do
		@amazon_ws.aws_secret_key.should == "xxxx"
	end
	
	it "should match search index" do
		@amazon_ws.search_index.should == "Books"
	end
	
	it "should match search index" do
		@amazon_ws.keyword.should == "searching the book"
	end
	it "should match search index" do
		@amazon_ws.search.should == 23
	end

end
