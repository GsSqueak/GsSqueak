stepping and presenter
step

	| delta halfDW |

	(self valueOfProperty: #currentCameraVersion ifAbsent: [0]) = 
							self currentCameraVersion ifFalse: [
		self patchOldVersion1.
		self setProperty: #currentCameraVersion toValue: self currentCameraVersion.
	].
	super step.
	self doProgrammedMoves.

	(currentKeyDown ifNil: [#()]) do: [ :each | | action |
		action := upDownCodes at: each ifAbsent: [#fugeddaboutit].
		action == #in ifTrue: [
			target scaleImageBy: -10.
		].
		action == #out ifTrue: [
			target scaleImageBy: 10.
		].
		action == #up ifTrue: [
			target tiltImageBy: -20.
		].
		action == #down ifTrue: [
			target tiltImageBy: 20.
		].
	].
	mouseMovePoint ifNil: [^self].
	mouseDownPoint ifNil: [^self].
	target ifNil: [^self].
	halfDW := self deadZoneWidth // 2.
	delta := mouseMovePoint - mouseDownPoint.
	delta x abs <= halfDW ifTrue: [delta := 0@delta y].
	delta y abs <= halfDW ifTrue: [delta := delta x@0].
	
	target panImageBy: delta x.



