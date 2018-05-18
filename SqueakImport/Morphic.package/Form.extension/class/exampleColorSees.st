*Morphic-examples
exampleColorSees
	"Form exampleColorSees"
	"First column as above shows the sneaky red/yellow pirate sneaking up on the blue/peach galleon.
	Second column shows the 1bpp made from the red/yellow/transparent - white -> ignore this, black -> test this
	Third shows the hit area - where red touches blue - superimposed on the original scene.
	Fourth column is the tally of hits via the old algorithm
	Last column shows the tally of hits via the new prim"	
		
	|formA formB maskA  offset tally map intersection left top dCanvas sensitiveColor soughtColor index|
	formA := formB := maskA := offset := tally := map := intersection :=  nil. "just to shut up the compiler when testing"
	ActiveWorld restoreMorphicDisplay; doOneCycle.

	sensitiveColor := Color red.
	soughtColor := Color blue.

	top := 50.
	dCanvas := FormCanvas on: Display.
	-50 to: 80 by: 10 do:[:p|
		offset:= p@0. "vary this to check different states"
		left := 10.

		formA := (Form extent: 100@50 depth: 32) asFormOfDepth: 16 "so we can try original forms of other depths".
		formB := Form extent: 100@50 depth: 32.

		"make a red square in the middle of the form"
		(FormCanvas on: formA) fillRectangle: (25@25 extent: 50@5) fillStyle: sensitiveColor.
		(FormCanvas on: formA) fillRectangle: (25@30 extent: 50@5) fillStyle: Color transparent.
		(FormCanvas on: formA) fillRectangle: (25@35 extent: 50@50) fillStyle: Color yellow.
		"formA displayOn: Display at: left@top rule: Form paint.
		dCanvas frameRectangle: (left@top extent: formA extent) width:2 color: Color green.
		left := left + 150."

		"make a blue block on the right half of the form"
		(FormCanvas on: formB) fillRectangle: (50@0 extent: 50@100) fillStyle: soughtColor.
		(FormCanvas on: formB) fillRectangle: (60@0 extent: 10@100) fillStyle: Color palePeach.
		"formB displayOn: Display at: left@top rule: Form paint.
		dCanvas frameRectangle: (left@top extent: formA extent) width:2 color: Color green.
		left := left + 150."

		intersection := (formA boundingBox translateBy: offset) intersect: (formB boundingBox).

		formB displayOn: Display at: left@top rule: Form paint.
		formA displayOn: Display at: (left@top) + offset rule: Form paint.
		dCanvas frameRectangle: (intersection translateBy: left@top) width:2 color: Color green.
		left := left + 150.
	
		maskA := Form extent: intersection extent depth: 1.

		map := Bitmap new: (1 bitShift: (formA depth min: 15)).
		map at: (index := sensitiveColor indexInMap: map) put: 1.

		maskA copyBits: (intersection translateBy:  offset negated) from: formA at: 0@0 colorMap: map.
		formB displayOn: Display at: left@top rule: Form paint.
		formA displayOn: Display at: (left@top) + offset rule: Form paint.
		maskA displayOn: Display at: (left@top) + intersection origin rule: Form paint.
		dCanvas frameRectangle: (intersection translateBy: left@top) width:2 color: Color green.	left := left + 150.

		"intersect world pixels of the color we're looking for with sensitive pixels mask"
		map at: index put: 0.  "clear map and reuse it"
		map at: (soughtColor indexInMap: map) put: 1.

		maskA
	 		copyBits: intersection
			from: formB at: 0@0 clippingBox: formB boundingBox
			rule: Form and
			fillColor: nil
			map: map.

		formB displayOn: Display at: left@top rule: Form paint.
		formA displayOn: Display at: (left@top) + offset rule: Form paint.
		maskA displayOn: Display at: (left@top) + intersection origin rule: Form paint.
		dCanvas frameRectangle: (intersection translateBy: left@top) width:2 color: Color green.
		left := left + 170.
		
		(maskA tallyPixelValues at: 2) asString asDisplayText displayOn: Display at: left@(top +20).
		left := left + 70.
		
		"now try using the new primitive"
		tally := (BitBlt
			destForm: formB
			sourceForm: formA
			fillColor: nil
			combinationRule: 3 "really ought to work with nil but prim code checks"
			destOrigin: intersection origin
			sourceOrigin: (offset negated max: 0@0)
			extent: intersection extent 
			clipRect: intersection)
				primCompareColor: ((sensitiveColor pixelValueForDepth: formA depth) ) to: ((soughtColor pixelValueForDepth: formB depth) ) test: (Form compareMatchColor bitOr: Form compareTallyFlag).
		tally  asString asDisplayText displayOn: Display at: left@(top +20).
		top:= top + 60]

