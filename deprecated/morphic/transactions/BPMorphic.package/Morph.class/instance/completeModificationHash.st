testing
completeModificationHash
	"World completeModificationHash"
	| resultSize result |
	resultSize := 10.
	result := ByteArray new: resultSize.
	self
		allMorphsDo: [:each | 
			| here |
			here := each modificationHash.
			here
				withIndexDo: [:ch :index | 
					| i |
					i := index \\ resultSize + 1.
					result
						at: i
						put: ((result at: i)
								bitXor: ch asciiValue)]].
	^ result