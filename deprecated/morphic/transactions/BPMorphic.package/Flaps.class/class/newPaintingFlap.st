predefined flaps
newPaintingFlap
	"Add a flap with the paint palette in it"
	"Flaps reinstateDefaultFlaps. Flaps addPaintingFlap"
	| _gsSqueakTemp_aFlap _gsSqueakTemp_aFlapTab |
	_gsSqueakTemp_aFlap := PasteUpMorph new borderWidth: 0.
	_gsSqueakTemp_aFlap color: Color transparent.
	_gsSqueakTemp_aFlap layoutPolicy: TableLayout new.
	_gsSqueakTemp_aFlap hResizing: #shrinkWrap.
	_gsSqueakTemp_aFlap vResizing: #shrinkWrap.
	_gsSqueakTemp_aFlap cellPositioning: #topLeft.
	_gsSqueakTemp_aFlap clipSubmorphs: false.
	_gsSqueakTemp_aFlap beSticky.
	"really?!"
	_gsSqueakTemp_aFlap addMorphFront: PaintBoxMorph new.
	_gsSqueakTemp_aFlap setProperty: #flap toValue: true.
	_gsSqueakTemp_aFlap fullBounds.
	"force layout"
	_gsSqueakTemp_aFlapTab := FlapTab new referent: _gsSqueakTemp_aFlap.
	_gsSqueakTemp_aFlapTab setNameTo: 'Painting' translated.
	_gsSqueakTemp_aFlapTab setProperty: #priorWording toValue: 'Paint' translated.
	_gsSqueakTemp_aFlapTab useGraphicalTab.
	_gsSqueakTemp_aFlapTab removeAllMorphs.
	_gsSqueakTemp_aFlapTab setProperty: #paintingFlap toValue: true.
	_gsSqueakTemp_aFlapTab addMorphFront: self paintFlapButton.
	"(SketchMorph withForm: (ScriptingSystem formAtKey:
	#PaintingFlapPic)) "
	_gsSqueakTemp_aFlapTab cornerStyle: #rounded.
	_gsSqueakTemp_aFlapTab edgeToAdhereTo: #right.
	_gsSqueakTemp_aFlapTab setToPopOutOnDragOver: false.
	_gsSqueakTemp_aFlapTab setToPopOutOnMouseOver: false.
	_gsSqueakTemp_aFlapTab
		on: #mouseUp
		send: #startOrFinishDrawing:
		to: _gsSqueakTemp_aFlapTab.
	_gsSqueakTemp_aFlapTab setBalloonText: 'Click here to start or finish painting.' translated.
	_gsSqueakTemp_aFlapTab fullBounds.
	"force layout"
	_gsSqueakTemp_aFlapTab position: 0 @ 6.
	self currentWorld addMorphFront: _gsSqueakTemp_aFlapTab.
	^ _gsSqueakTemp_aFlapTab