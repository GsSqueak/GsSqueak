*Morphic-MorphicExtras-initialization
initializeToShow: aMorph withLabel: aLabel andSend: aSelector to: aReceiver 	
	"Initialize the receiver to show the current appearance of aMorph on its face, giving it the label supplied and arranging for it, when the button goes down on it, to obtain a new morph by sending the specified selector to the specified receiver"

	| aThumbnail |
	aThumbnail := Thumbnail new.
	aThumbnail makeThumbnailFromForm: (aMorph imageFormDepth: 32).
	^ self initializeWithThumbnail: aThumbnail withLabel: aLabel andColor: self color andSend: aSelector to: aReceiver 	