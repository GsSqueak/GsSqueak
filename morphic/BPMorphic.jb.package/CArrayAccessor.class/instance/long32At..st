accessing
<<<<<<< HEAD
long32At: index
  | idx |
  idx := (offset + index) // 4 + 1.	"Note: This is a special hack for BitBlt."
  idx = (object basicSize + 1)
    ifTrue: [ ^ 0 ].
  ^ object basicAt: idx
=======
long32At: index 
	| idx |
	idx := offset + index // 4 + 1.
	"Note: This is a special hack for BitBlt."
	idx = (object basicSize + 1)
		ifTrue: [^ 0].
	^ object basicAt: idx
>>>>>>> 86cf22511f03aabffa314974130a17d983e10e09
