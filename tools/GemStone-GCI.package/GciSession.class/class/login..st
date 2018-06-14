instance creation
login: aSessionDescription

	^ (self sessionDescription: aSessionDescription)
		login;
		yourself