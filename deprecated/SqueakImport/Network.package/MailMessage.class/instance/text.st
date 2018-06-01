accessing
text
	
	^ String streamContents: [ :str | | encodedBodyText |
		"first put the header"
		(fields associations , {'content-type' -> {self body contentTypeHeaderValue} })
				do: [ :assoc  | | fieldName fieldValues | 
					fieldName := assoc key.
					fieldValues := assoc value.
					fieldValues do: [ :fieldValue |
						str
							nextPutAll: fieldName capitalized ;
							nextPutAll: ': ';
							nextPutAll: fieldValue asHeaderValue;
							cr ]].
		
		 self body contentTransferEncodingHeaderValue 
			ifNotNil: [:headerValue |
				str
					nextPutAll: 'content-transfer-encoding' capitalized;
					nextPutAll: ': ';
					nextPutAll: headerValue asHeaderValue;
					cr  ].
		
		"skip a line between header and body"
		str cr.

		"put the body, being sure to encode it according to the header"
		encodedBodyText := body asSendableBodyText.
		str nextPutAll: encodedBodyText ].