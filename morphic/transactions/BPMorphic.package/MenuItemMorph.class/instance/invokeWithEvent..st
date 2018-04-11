events
invokeWithEvent: evt 
	"Perform the action associated with the given menu item."
	self isEnabled
		ifFalse: [^ self].
	target class == HandMorph
		ifTrue: [self notObsolete
				ifFalse: [^ self]].
	owner
		ifNotNil: [self isStayUpItem
				ifFalse: [self flag: #workAround.
					"The tile system invokes menus straightforwardly so
					the menu might not be in the world."
					self world
						ifNotNil: [:_gsSqueakTemp_w | 
							owner deleteIfPopUp: evt.
							"Repair damage before invoking the action for
							better feedback"
							_gsSqueakTemp_w displayWorldSafely]]].
	selector
		ifNil: [^ self].
	Cursor normal
		showWhile: [| selArgCount | "show cursor in case item opens a new MVC window"
			(selArgCount := selector numArgs) = 0
				ifTrue: [target perform: selector]
				ifFalse: [selArgCount = arguments size
						ifTrue: [target perform: selector withArguments: arguments]
						ifFalse: [target
								perform: selector
								withArguments: (arguments copyWith: evt)]]]