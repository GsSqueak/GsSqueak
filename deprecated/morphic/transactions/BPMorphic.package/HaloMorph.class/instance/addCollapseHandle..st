handles
addCollapseHandle: handleSpec 
	"Add the collapse handle, with all of its event handlers set up, unless
	the target's owner is not the world or the hand."
	| _gsSqueakTemp_collapseHandle |
	(target owner notNil
			and: ["nil happens, amazingly"
				target owner isWorldOrHandMorph])
		ifFalse: [^ self].
	_gsSqueakTemp_collapseHandle := self
				addHandle: handleSpec
				on: #mouseDown
				send: #mouseDownInCollapseHandle:with:
				to: self.
	_gsSqueakTemp_collapseHandle
		on: #mouseUp
		send: #maybeCollapse:with:
		to: self.
	_gsSqueakTemp_collapseHandle
		on: #mouseMove
		send: #setDismissColor:with:
		to: self