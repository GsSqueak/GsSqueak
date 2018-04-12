model access
filename
	^ self currentSelection
		ifNil: ['']
		ifNotNil: [:sel | String
				streamContents: [:stream | sel allFilenames
						do: [:filename | stream nextPutAll: filename]
						separatedBy: [stream nextPut: $,;
								 nextPut: Character space]]]