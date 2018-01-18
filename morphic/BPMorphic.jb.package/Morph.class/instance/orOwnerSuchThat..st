structure
orOwnerSuchThat: conditionBlock 	(conditionBlock value: self)		ifTrue: [^ self].	self		allOwnersDo: [:m | (conditionBlock value: m)				ifTrue: [^ m]].	^ nil