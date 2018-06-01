private
deactivateAttributesEnding: ending starting: starting
	
	ending reversed
		reject: [:attribute | attribute shouldFormBlocks]
		thenDo: [: attribute | self writeEndTagFor: attribute];
		select: [:attribute | attribute shouldFormBlocks]
		thenDo: [: attribute |
			(starting includes: attribute) ifFalse: [self writeEndTagFor: attribute]].