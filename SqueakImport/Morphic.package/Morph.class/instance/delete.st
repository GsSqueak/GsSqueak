submorphs-add/remove
delete
	"Remove the receiver as a submorph of its owner and make its 
	new owner be nil."
	| oldWorld |
	self removeHalo.
	(oldWorld := self world) ifNotNil: [
		self disableSubmorphFocusForHand: self activeHand.
		self activeHand
	  		releaseKeyboardFocus: self;
			releaseMouseFocus: self].
	owner ifNotNil: [
		self privateDelete. "remove from world"
		self player ifNotNil: [:player |
			oldWorld ifNotNil: [
				player noteDeletionOf: self fromWorld: oldWorld]]].