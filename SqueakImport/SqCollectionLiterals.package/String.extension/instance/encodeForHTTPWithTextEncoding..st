*SqCollectionLiterals-converting
encodeForHTTPWithTextEncoding: encodingName

	^ self encodeForHTTPWithTextEncoding: encodingName conditionBlock: [:c | c isSafeForHTTP].
