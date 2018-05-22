Nebraska
remoteServer: aNebraskaServer

	| h |

	worldState remoteServer: aNebraskaServer.
	h := self primaryHand.
	aNebraskaServer ifNil:[
		(h hasProperty: #representingTheServer) ifTrue: [
			h removeProperty: #representingTheServer.
			h userInitials: '' andPicture: nil.
		]
	] ifNotNil:[
		(h hasProperty: #representingTheServer) ifFalse: [
			h setProperty: #representingTheServer toValue: true.
			h userInitials: Utilities authorName andPicture: nil.
		]
	].