menu
destroyFlap
	"Destroy the receiver"

	| reply request |
	request := self isGlobalFlap
		ifTrue:
			['Caution -- this would permanently
remove this flap, so it would no longer be
available in this or any other project.
Do you really want to this? ' translated]
		ifFalse:
			['Caution -- this is permanent!  Do
you really want to do this? ' translated].
	reply := self confirm: request translated orCancel: [^ self].
	reply ifTrue:
		[self isGlobalFlap
			ifTrue:
				[Flaps removeFlapTab: self keepInList: false.
				self currentWorld reformulateUpdatingMenus]
			ifFalse:
				[referent isInWorld ifTrue: [referent delete].
				self delete]]