

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
		@responseDetails = self.post('/register', @options)		
	end 

	def self.nuke(gameID, xCoord,yCoord) 
					@options = {:body => {
							:id => gameID, 
							:x => xCoord,
							:y => yCoord
							}.to_json,
					:headers => { 
							'Content-Type' => 'application/json' 
							}
					}			
		@responseDetails = self.post('/nuke', @options)		
	end
end