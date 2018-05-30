menu
avoidVisibleBordersAtEdgeString
	"Answer the string to be shown in a menu to represent the  
	'resistsRemoval' status"
	^ (self avoidVisibleBordersAtEdge
		ifTrue: ['<on>']
		ifFalse: ['<off>'])
		, 'avoid visible borders at edge' translated