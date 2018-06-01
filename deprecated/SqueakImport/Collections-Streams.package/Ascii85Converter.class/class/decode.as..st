convenience
decode: aStringOrStream as: contentsClass

	^ contentsClass streamContents:
		[:out | self decode: aStringOrStream to: out]