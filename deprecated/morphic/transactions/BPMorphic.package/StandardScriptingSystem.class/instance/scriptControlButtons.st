-Etoys-script-control
scriptControlButtons
	"Answer a composite object that serves to control the stop/stop/go
	status of a Presenter"
	| _gsSqueakTemp_wrapper |
	_gsSqueakTemp_wrapper := AlignmentMorph newRow setNameTo: 'script controls'.
	_gsSqueakTemp_wrapper vResizing: #shrinkWrap.
	_gsSqueakTemp_wrapper hResizing: #shrinkWrap.
	_gsSqueakTemp_wrapper addMorph: self stopButton.
	_gsSqueakTemp_wrapper addMorphBack: self stepButton.
	_gsSqueakTemp_wrapper addMorphBack: self goButton.
	_gsSqueakTemp_wrapper beTransparent.
	^ _gsSqueakTemp_wrapper