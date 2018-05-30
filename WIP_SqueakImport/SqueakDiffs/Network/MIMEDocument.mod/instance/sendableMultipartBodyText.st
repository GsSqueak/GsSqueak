serializing
sendableMultipartBodyText

	^ String streamContents: [ :str |
		str cr.
		parts do: [ :part |
			str
				cr;
				nextPutAll: '--';
				nextPutAll: self attachmentSeparator;
				cr;
				nextPutAll: part asSendablePartText ].
	
		str
			cr;
			nextPutAll: '--';
			nextPutAll: self attachmentSeparator;
			nextPutAll: '--';
			cr ]