access
atEnd

	position >= readLimit ifFalse: [^ false].  "more in segment"
	^ self position >= endOfFile  "more in file"