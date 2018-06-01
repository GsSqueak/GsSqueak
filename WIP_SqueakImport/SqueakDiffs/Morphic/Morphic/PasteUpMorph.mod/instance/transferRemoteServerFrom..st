Nebraska
transferRemoteServerFrom: aWorld
	"Transfer the remote server which was associated with aWorld (if any) to the receiver"
	| server |
	(aWorld notNil and:[aWorld isMorph and:[aWorld isWorldMorph]]) ifFalse:[^self].
	server := aWorld remoteServer.
	server ifNotNil:[
		self remoteServer: server.
		server clients do:[:each| self addRemoteClient: each].
		self primaryHand
			userInitials: (aWorld primaryHand userInitials)
			andPicture: (aWorld primaryHand userPicture).
		aWorld primaryHand userInitials: '' andPicture: nil].
	aWorld releaseRemoteServer.