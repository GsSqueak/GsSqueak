private
activateAttributesEnding: ending starting: starting 

	starting
		select: [:attribute | attribute shouldFormBlocks]
		thenDo: [: attribute |
			(ending includes: attribute) ifFalse: [self writeStartTagFor: attribute]];
		reject: [:attribute | attribute shouldFormBlocks]
		thenDo: [: attribute | self writeStartTagFor: attribute].