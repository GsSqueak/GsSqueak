file-in/out
storeServerEntryOn: stream
	
	stream
		nextPutAll: 'name:'; tab; nextPutAll: (ServerDirectory nameForServer: self); cr;
		nextPutAll: 'directory:'; tab; nextPutAll: self directory; cr;
		nextPutAll: 'type:'; tab; nextPutAll: self typeForPrefs; cr;
		nextPutAll: 'server:'; tab; nextPutAll: self server; cr.
	group
		ifNotNil: [stream nextPutAll: 'group:'; tab; nextPutAll: self groupName; cr].
	self user
		ifNotNil: [stream nextPutAll: 'user:'; tab; nextPutAll: self user; cr].
	self passwordSequence
		ifNotNil: [stream nextPutAll: 'passwdseq:'; tab; nextPutAll: self passwordSequence asString; cr].
	self altUrl
		ifNotNil: [stream nextPutAll: 'url:'; tab; nextPutAll: self altUrl; cr].
	self loaderUrl
		ifNotNil: [stream nextPutAll: 'loaderUrl:'; tab; nextPutAll: self loaderUrl; cr].
	self acceptsUploads
		ifTrue: [stream nextPutAll: 'acceptsUploads:'; tab; nextPutAll: 'true'; cr].
	self encodingName
		ifNotNil: [stream nextPutAll: 'encodingName:'; tab; nextPutAll: self encodingName; cr].