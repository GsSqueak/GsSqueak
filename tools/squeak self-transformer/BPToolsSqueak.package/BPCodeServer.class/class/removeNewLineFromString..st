as yet unclassified
removeNewLineFromString: aString

	^ aString select: [:each | (each = Character cr or: each = Character lf) not].