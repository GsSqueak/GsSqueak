sourcePointer conversion
checkOKToAdd: size at: filePosition
	"Issue several warnings as the end of the changes file approaches its limit,
	and finally halt with an error when the end is reached."

	| fileSizeLimit margin |
	fileSizeLimit := 16r2000000.
	3 to: 1 by: -1 do:
		[:i | margin := i*100000.
		(filePosition + size + margin) > fileSizeLimit
			ifTrue: [(filePosition + margin) > fileSizeLimit ifFalse:
						[self inform: 'WARNING: your changes file is within
' , margin printString , ' characters of its size limit.
You should take action soon to reduce its size.
You may proceed.']]
			ifFalse: [^ self]].
	(filePosition + size > fileSizeLimit) ifFalse: [^ self].
	self error: 'You have reached the size limit of the changes file.
You must take action now to reduce it.
Close this error.  Do not attempt to proceed.'