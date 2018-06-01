serializing
asSendablePartText

	^ String streamContents: [ :str | | |
		"first put the header"
		fields keysAndValuesDo: [ :fieldName :fieldValues |
			fieldValues do: [ :fieldValue |
				str
					nextPutAll: fieldName capitalized ;
					nextPutAll: ': ';
					nextPutAll: fieldValue asHeaderValue;
					cr ]. ].
			
		str cr.
			
		str nextPutAll: self asSendableBodyText].