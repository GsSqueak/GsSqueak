options
setPartsBinStatusTo: aBoolean 
	isPartsBin := aBoolean.
	aBoolean
		ifFalse: [self enableDragNDrop].
	"but note that we no longer reset openToDragNDrop to false upon
	making it a parts bin again"
	isPartsBin
		ifTrue: [submorphs
				do: [:m | 
					m isPartsDonor: true.
					m stopStepping.
					m suspendEventHandler]]
		ifFalse: [submorphs
				do: [:m | 
					m isPartsDonor: false.
					m restoreSuspendedEventHandler].
			self world
				ifNotNil: [self world startSteppingSubmorphsOf: self]]