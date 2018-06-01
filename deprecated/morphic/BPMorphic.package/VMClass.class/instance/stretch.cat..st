C library extensions
stretch: s1 cat: s2 
	| _gsSqueakTemp_ns |
	^ self
		cCode: [_gsSqueakTemp_ns := self malloc: (self strlen: s1)
							+ (self strlen: s2) + 2.
			self str: _gsSqueakTemp_ns cpy: s1.
			self str: _gsSqueakTemp_ns cat: s2]
		inSmalltalk: [self str: s1 cat: s2]