file out/in
newTextStyleFromTTFile: fileName encodingTag: encodingTag ranges: ranges

	| description |
	description := TTFontDescription addSetFromTTFile: fileName encodingTag: encodingTag ranges: ranges.
	self newTextStyleFromTT: description.
	^ description.
