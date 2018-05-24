private
defaultImageHandler
	^ExternalDropHandler
		type: 'image/'
		extension: nil
		action: [:stream :pasteUp :event |
			| image sketch |
			stream binary.
			image := Form fromBinaryStream: stream contents asByteArray readStream.
			Project current resourceManager 
				addResource: image 
				url: (FileDirectory urlForFileNamed: stream name) asString.
			sketch := Project current world drawingClass withForm: image.
			pasteUp addMorph: sketch centeredNear: event position.
			image := sketch := nil]