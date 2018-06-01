accessing
normalize
	"Correspondence between buttons and stamp forms has changed.  Make all thumbnails show up right."

	| shrunkForm button trans |
	1 to: stampButtons size do: [:ind |
		shrunkForm := thumbnailPics atWrap: ind+start-1.
		button := stampButtons at: ind.
		shrunkForm 
			ifNil: [trans := Form extent: button extent depth: 8.
				trans fill: trans boundingBox fillColor: Color transparent.
				button onImage: trans]
			ifNotNil: [button onImage: shrunkForm].
		button offImage: shrunkForm; pressedImage: shrunkForm.	"later modify them"
		].