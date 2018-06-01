actions
pickupForm: stampForm 
	"Install the new picture in this stamp"
	| _gsSqueakTemp_stampButton |
	stampHolder stampForm: stampForm for: tool.
	_gsSqueakTemp_stampButton := action == #pickup:
				ifTrue: [stampHolder otherButtonFor: tool]
				ifFalse: [tool].
	"was a nil stampForm"
	_gsSqueakTemp_stampButton state: #on.
	_gsSqueakTemp_stampButton doButtonAction