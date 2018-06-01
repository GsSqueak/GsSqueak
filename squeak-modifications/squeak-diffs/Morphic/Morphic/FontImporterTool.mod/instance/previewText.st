model access
previewText

	^ self selectedFont
		ifNil: [Text new]
		ifNotNil: [:font | font sampleText]