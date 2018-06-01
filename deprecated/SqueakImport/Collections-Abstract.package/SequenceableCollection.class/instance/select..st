enumerating
select: aBlock 
	"Refer to the comment in Collection|select:."
	| aStream |
	aStream := WriteStream on: (self species new: self size).
	1 to: self size do: 
		[:index |
		(aBlock value: (self at: index))
			ifTrue: [aStream nextPut: (self at: index)]].
	^ aStream contents