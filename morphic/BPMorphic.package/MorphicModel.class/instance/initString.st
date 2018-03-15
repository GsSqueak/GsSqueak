printing
initString
	^ String
		streamContents: [:s | s nextPutAll: self class name;
				 nextPutAll: ' newBounds: (';
				 print: bounds;
				 nextPutAll: ') model: self slotName: ';
				 print: slotName]