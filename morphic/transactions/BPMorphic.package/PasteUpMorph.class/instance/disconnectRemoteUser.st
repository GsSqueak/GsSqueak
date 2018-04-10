world menu
disconnectRemoteUser
	"Prompt for the initials of the remote user, then remove the remote
	hand with those initials, breaking its connection."
	"select hand to remove"
	| initials handToRemove |
	initials := UIManager default request: 'Enter initials for remote user''s cursor?'.
	initials isEmpty
		ifTrue: [^ self].
	"abort"
	handToRemove := nil.
	self
		handsDo: [:h | h userInitials = initials
				ifTrue: [handToRemove := h]].
	handToRemove
		ifNil: [^ self].
	"no hand with those initials"
	handToRemove withdrawFromWorld