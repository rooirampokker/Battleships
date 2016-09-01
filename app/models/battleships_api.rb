

class BattleshipsAPI 
	include HTTParty
	base_uri 'http://battle.platform45.com'
	
	def self.register(username, emailAddress)
		@options = {:body => {
							:name => username, 
							:email => emailAddress
							}.to_json,
					:headers => { 
							'Content-Type' => 'application/json' 
							}
					}
		@sessionDetails = self.post('/register', @options)		
	end 
end