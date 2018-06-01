accessing
mainValue
	^ [mainValue decodeMimeHeader]
		on: InvalidUTF8 , NoConverterFound do: [:e | mainValue]