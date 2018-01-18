accessing
assureFlapWidth: requestedWidth 	| tab |	self width: requestedWidth.	tab := self flapTab				ifNil: [^ self].	tab flapShowing		ifTrue: [tab hideFlap; showFlap]