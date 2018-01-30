dropping/grabbing
morphToDropForTransferMorph: aTransferMorph 
	"aTransferMorph has been dragged directly onto the desktop.
	TransferMorphs, by nature, are about transferring a 'logical object'
	from another source. Answer the Morph that should actually be
	dropped on to the desktop."
	^ self perform: self transferMorphConverter with: aTransferMorph