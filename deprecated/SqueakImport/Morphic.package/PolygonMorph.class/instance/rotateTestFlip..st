debug and other
rotateTestFlip: aBool 
	"Return one copy of me for each vertex using each vertex as  
	the  
	starting point.  
	Vary to border color to destinguish the copies.  
	This tests closed curves for their consistency.  
	The flip boolean tests the reversed rotations."
	| len colors verts flip |
	verts := self vertices.
	flip := aBool == true
				ifTrue: [1]
				ifFalse: [0].
	len := verts size.
	colors := Color wheel: len*2 .
	(1 to: len)
		do: [:i | | j | (self copy
				borderColor: (colors at: (j:=i * 2 - flip));
				 yourself)
				setVertices: (verts flipRotated: j);
				 openInWorld]