convenience
encode: aCollectionOrStream

	^ String streamContents:
		[:out | self encode: aCollectionOrStream to: out]