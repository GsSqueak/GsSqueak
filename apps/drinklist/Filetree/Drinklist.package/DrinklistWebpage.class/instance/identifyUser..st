communication
identifyUser: userID

	"Communicate with other component to retrive user profile"
	self state: #choose.
	self user: userID.
		
	self user ifNil: [
		self inform: 'User does not exist'.
		self state: #start].
