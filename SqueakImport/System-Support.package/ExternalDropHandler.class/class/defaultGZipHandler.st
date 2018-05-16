private
defaultGZipHandler
	^ExternalDropHandler
		type: nil
		extension: 'gz'
		action: [:stream :pasteUp :event | | contents |
			contents := Cursor wait showWhile: [stream viewGZipContents].
				UIManager default
					edit: contents
					label: 'Decompressed contents of: ', stream localName].