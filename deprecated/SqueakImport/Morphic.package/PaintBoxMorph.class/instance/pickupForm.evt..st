actions
pickupForm: stampForm evt: evt
	"Install the new picture in this stamp"

	| stampButton |
	stampHolder stampForm: stampForm for: tool.
	stampButton := action == #pickup: 
		ifTrue: [stampHolder otherButtonFor: tool]
		ifFalse: [tool].	"was a nil stampForm"
	stampButton state: #on.
	stampButton doButtonAction: evt.