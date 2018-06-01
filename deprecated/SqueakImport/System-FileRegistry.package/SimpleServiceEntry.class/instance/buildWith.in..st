toolbuilder
buildWith: builder in: aModel
	"Answer a button spec that will trigger the receiver service in aModel"
	| buttonSpec |
	buttonSpec := builder pluggableActionButtonSpec new.
	buttonSpec 
		model: self; 
		label: self buttonLabel;
		help: self description;
		action: (MessageSend receiver: aModel selector: #executeService: argument: self).
	^builder build: buttonSpec