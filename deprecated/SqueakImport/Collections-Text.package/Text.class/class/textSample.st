filler text
textSample

	^ self streamContents: [:stream |
		stream 
			nextPutAll: self hamburgefonstiv; cr;
			nextPutAll: self theQuickBrownFox; cr;
			nextPutAll: self THEQUICKBROWNFOX; cr; cr;
			nextPutAll: self allDigits; cr; cr;
			nextPutAll: self loremIpsum]