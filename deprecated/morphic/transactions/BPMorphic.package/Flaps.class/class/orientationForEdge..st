miscellaneous
orientationForEdge: anEdge 
	"Answer the orientation -- #horizontal or #vertical -- that corresponds
	to the edge symbol"
	^ (#(#left #right ) includes: anEdge)
		ifTrue: [#vertical]
		ifFalse: [#horizontal]