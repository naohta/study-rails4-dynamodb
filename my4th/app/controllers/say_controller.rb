require 'aws-sdk'
class SayController < ApplicationController
  
  def hello
  	puts "I'm hello method."
    id = 'AWS_ACCESS_KEY_ID'
    sec = 'AWS_SECRET_ACCESS_KEY' 
    puts id + ' ' + ENV[id]
    puts sec + ' ' + ENV[sec]
    myTable = AWS::DynamoDB.new(
      dynamo_db_endpoint:'dynamodb.ap-northeast-1.amazonaws.com',
      access_key_id:ENV[id],
      secret_access_key:ENV[sec]
    ).tables['rails4-dynamodb-sample']
    myTable.load_schema
    myTable.items.create(hash:'dave',range:'akita')
  end

end
