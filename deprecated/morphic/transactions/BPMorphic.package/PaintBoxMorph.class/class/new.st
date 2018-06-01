instance creation
new
	| _gsSqueakTemp_pb |
	_gsSqueakTemp_pb := self prototype veryDeepCopy.
	"Assume that the PaintBox does not contain any scripted Players!"
	_gsSqueakTemp_pb stampHolder normalize.
	"Get the stamps to show"
	"Get my own copies of the brushes so I can modify them"
	#(#brush1: #brush2: #brush3: #brush4: #brush5: #brush6: )
		do: [:sel | 
			| dualUse button |
			button := _gsSqueakTemp_pb submorphNamed: sel.
			button offImage: button offImage deepCopy.
			dualUse := button onImage == button pressedImage.
			"sometimes shared"
			button onImage: button onImage deepCopy.
			dualUse
				ifTrue: [button pressedImage: button onImage]
				ifFalse: [button pressedImage: button pressedImage deepCopy]].
	_gsSqueakTemp_pb showColor.
	_gsSqueakTemp_pb fixUpRecentColors.
	_gsSqueakTemp_pb addLabels.
	^ _gsSqueakTemp_pb