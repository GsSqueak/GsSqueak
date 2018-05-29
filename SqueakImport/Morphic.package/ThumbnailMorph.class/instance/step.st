stepping and presenter
step
	"Optimization: Don't redraw if we're viewing some kind of SketchMorph and its rotated Form hasn't changed."

	| viewee f |
	viewee := self actualViewee.
	viewee ifNil: [self stopStepping. ^ self].
	viewee isSketchMorph
		ifTrue:
			[f := viewee rotatedForm.
			f == lastSketchForm ifTrue: [^ self].  "The optimization"
			lastSketchForm := f]
		ifFalse:
			[lastSketchForm := nil].  "Avoids subtle bug if sketchMorph removed and then put back in"
	self changed
