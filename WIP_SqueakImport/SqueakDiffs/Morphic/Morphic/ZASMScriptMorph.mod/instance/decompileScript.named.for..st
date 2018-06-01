as yet unclassified
decompileScript: aScript named: aString for: aController

	| newMorphs prevPt prevScale |

	self removeAllMorphs.
	self setProperty: #cameraController toValue: aController.
	self setProperty: #cameraScriptName toValue: aString.

	newMorphs := OrderedCollection new.
	prevPt := prevScale := nil.
	aScript do: [ :each | | cameraPoint mark cameraScale |
		cameraPoint := each at: #startPoint ifAbsent: [nil].
		cameraScale := each at: #startZoom ifAbsent: [nil].
		(prevPt = cameraPoint and: [prevScale = cameraScale]) ifFalse: [
			mark := ZASMCameraMarkMorph new.
			mark cameraPoint: cameraPoint cameraScale: cameraScale controller: aController.
			newMorphs add: mark.
		].
		newMorphs add: (ZASMStepsMorph new setStepCount: (each at: #steps ifAbsent: [10])).
		cameraPoint := each at: #endPoint ifAbsent: [nil].
		cameraScale := each at: #endZoom ifAbsent: [nil].
		mark := ZASMCameraMarkMorph new.
		mark cameraPoint: cameraPoint cameraScale: cameraScale controller: aController.
		newMorphs add: mark.
		prevPt := cameraPoint.
		prevScale := cameraScale.
	].
	self addAllMorphs: newMorphs.
