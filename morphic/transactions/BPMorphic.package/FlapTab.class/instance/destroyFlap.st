menu
destroyFlap
	"Destroy the receiver"
	| _gsSqueakTemp_reply _gsSqueakTemp_request |
	_gsSqueakTemp_request := self isGlobalFlap
				ifTrue: ['Caution -- this would permanently
remove this flap, so it would no longer be
available in this or any other project.
Do you really want to this? ' translated]
				ifFalse: ['Caution -- this is permanent!  Do
you really want to do this? ' translated].
	_gsSqueakTemp_reply := self
				confirm: _gsSqueakTemp_request translated
				orCancel: [^ self].
	_gsSqueakTemp_reply
		ifTrue: [self isGlobalFlap
				ifTrue: [Flaps removeFlapTab: self keepInList: false.
					self currentWorld reformulateUpdatingMenus]
				ifFalse: [referent isInWorld
						ifTrue: [referent delete].
					self delete]]