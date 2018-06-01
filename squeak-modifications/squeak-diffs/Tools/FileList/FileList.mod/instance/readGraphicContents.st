private
readGraphicContents
	| form maxExtent ext |
	form := Form fromFileNamed: self fullName.
	maxExtent := lastGraphicsExtent := self availableGraphicsExtent.
	ext := form extent.
	(maxExtent notNil and: [form extent <= maxExtent]) ifFalse: [
		form := form magnify: form boundingBox by: (maxExtent x / form width min: maxExtent y / form height) asPoint smoothing: 3].
	contents :=  ('Image extent: ', ext printString) asText,
				(String with: Character cr),
				(Text string: ' '
					attribute: (TextFontReference toFont: 
						(FormSetFont new
							fromFormArray: (Array with: form)
							asciiStart: Character space asInteger
							ascent: form height))).
	brevityState := #graphic.
	^contents