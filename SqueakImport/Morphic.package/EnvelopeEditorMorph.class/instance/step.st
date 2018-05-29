stepping and presenter
step
	| mouseDown hand |
	hand := self world firstHand.
	(bounds containsPoint: hand position) ifFalse: [^ self].

	mouseDown := hand lastEvent redButtonPressed.
	mouseDown not & prevMouseDown ifTrue:
		["Mouse just went up"
		limitXs = (limits collect: [:i | (envelope points at: i) x]) ifFalse:
			["Redisplay after changing limits"
			self editEnvelope: envelope]].
	prevMouseDown := mouseDown