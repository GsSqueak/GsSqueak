instance creation
tryToDecodeBody: content as: encodingName

	^ [(MultiByteBinaryOrTextStream 
		with: content 
		encoding: encodingName) contents]
			on: InvalidUTF8 , NoConverterFound do: [(MultiByteBinaryOrTextStream 
										with: content 
										encoding: 'latin1') contents]