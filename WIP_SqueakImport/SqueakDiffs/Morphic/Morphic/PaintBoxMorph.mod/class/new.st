instance creation
new

	| pb |
	pb := self prototype veryDeepCopy.
		"Assume that the PaintBox does not contain any scripted Players!"
	pb stampHolder normalize.	"Get the stamps to show"
	"Get my own copies of the brushes so I can modify them"
	#(brush1: brush2: brush3: brush4: brush5: brush6:) do: [:sel | | dualUse button |
		button := pb submorphNamed: sel.
		button offImage: button offImage deepCopy.
		dualUse := button onImage == button pressedImage.	"sometimes shared"
		button onImage: button onImage deepCopy.
		dualUse
			ifTrue: [button pressedImage: button onImage]
			ifFalse: [button pressedImage: button pressedImage deepCopy].
		].
	pb showColor.
	pb fixUpRecentColors.
	pb addLabels.
	^ pb