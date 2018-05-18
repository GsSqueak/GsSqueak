world menu
connectRemoteUserWithName: nameStringOrNil picture: aFormOrNil andIPAddress: aStringOrNil
	"Prompt for the initials to be used to identify the cursor of a remote user, then create a cursor for that user and wait for a connection."

	| initials addr h |
	initials := nameStringOrNil.
	initials isEmptyOrNil ifTrue: [
		initials := UIManager default request: 'Enter initials for remote user''s cursor?'.
	].
	initials isEmpty ifTrue: [^ self].  "abort"
	addr := 0.
	aStringOrNil isEmptyOrNil ifFalse: [
		addr := NetNameResolver addressForName: aStringOrNil timeout: 30
	].
	addr = 0 ifTrue: [
		addr := NetNameResolver promptUserForHostAddress.
	].
	addr = 0 ifTrue: [^ self].  "abort"

	(RemoteHandMorph ensureNetworkConnected) ifFalse: [^ self]. "abort"

	h := RemoteHandMorph new userInitials: initials andPicture: aFormOrNil.
	self addHand: h.
	h changed.
	h startListening.
	h startTransmittingEventsTo: addr.
