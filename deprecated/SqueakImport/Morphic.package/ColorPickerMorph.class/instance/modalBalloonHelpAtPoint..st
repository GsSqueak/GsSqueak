private
modalBalloonHelpAtPoint: cursorPoint 
	self flag: #arNote.	"Throw this away. There needs to be another way."
	self submorphsDo: 
			[:m | 
			m wantsBalloon 
				ifTrue: 
					[(m valueOfProperty: #balloon) isNil
						ifTrue: 
							[(m containsPoint: cursorPoint) ifTrue: [m showBalloon: m balloonText]]
						ifFalse: [(m containsPoint: cursorPoint) ifFalse: [m deleteBalloon]]]]