Nebraska support
getActionFor: anEventOrHand

	^(self get: #action for: anEventOrHand) ifNil: [
		self set: #action for: anEventOrHand to: palette action
	].

