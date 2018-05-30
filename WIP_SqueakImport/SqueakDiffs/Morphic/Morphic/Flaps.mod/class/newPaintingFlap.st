predefined flaps
newPaintingFlap
	"Add a flap with the paint palette in it"

	| aFlap aFlapTab  |
	"Flaps reinstateDefaultFlaps. Flaps addPaintingFlap"

	aFlap := PasteUpMorph new borderWidth: 0.
	aFlap color: Color transparent.
	aFlap layoutPolicy: TableLayout new.
	aFlap hResizing: #shrinkWrap.
	aFlap vResizing: #shrinkWrap.
	aFlap cellPositioning: #topLeft.
	aFlap clipSubmorphs: false.

	aFlap beSticky. "really?!"
	aFlap addMorphFront: PaintBoxMorph new.
	aFlap setProperty: #flap toValue: true.
	aFlap fullBounds. "force layout"

	aFlapTab := FlapTab new referent: aFlap.
	aFlapTab setNameTo: 'Painting' translated.
	aFlapTab setProperty: #priorWording toValue: 'Paint' translated.
	aFlapTab useGraphicalTab.
	aFlapTab removeAllMorphs.
	aFlapTab setProperty: #paintingFlap toValue: true.
	aFlapTab addMorphFront: 
		"(SketchMorph withForm: (ScriptingSystem formAtKey: #PaintingFlapPic))"
		self paintFlapButton.
	aFlapTab cornerStyle: #rounded.
	aFlapTab edgeToAdhereTo: #right.
	aFlapTab setToPopOutOnDragOver: false.
	aFlapTab setToPopOutOnMouseOver: false.
	aFlapTab on: #mouseUp send: #startOrFinishDrawing: to: aFlapTab.
	aFlapTab setBalloonText:'Click here to start or finish painting.' translated.

	aFlapTab fullBounds. "force layout"
	aFlapTab position: (0@6).
	self currentWorld addMorphFront: aFlapTab.  
	^ aFlapTab