as yet unclassified
compileScript

	| newScript prevMark prevSteps |

	self fixup.
	newScript := OrderedCollection new.
	prevMark := prevSteps := nil.
	submorphs do: [ :each | | data |
		(each isKindOf: ZASMCameraMarkMorph) ifTrue: [
			prevMark ifNotNil: [
				data := Dictionary new.
				data 
					at: #steps put: prevSteps;
					at: #startPoint put: (prevMark valueOfProperty: #cameraPoint);
					at: #endPoint put: (each valueOfProperty: #cameraPoint);
					at: #startZoom put: (prevMark valueOfProperty: #cameraScale);
					at: #endZoom put: (each valueOfProperty: #cameraScale).
				newScript add: data.
			].
			prevMark := each.
		].
		(each isKindOf: ZASMStepsMorph) ifTrue: [
			prevSteps := each getStepCount.
		].
	].
	^newScript
