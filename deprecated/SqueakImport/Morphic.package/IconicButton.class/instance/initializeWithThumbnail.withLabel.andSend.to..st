initialization
initializeWithThumbnail: aThumbnail withLabel: aLabel andSend: aSelector to: aReceiver 	
	"Initialize the receiver to show aThumbnail on its face, giving it the label supplied and arranging for it, when the button goes down on it, to obtain a new morph by sending the supplied selector to the supplied receiver"

	^self initializeWithThumbnail: aThumbnail withLabel: aLabel andColor: Color transparent   andSend: aSelector to: aReceiver 	