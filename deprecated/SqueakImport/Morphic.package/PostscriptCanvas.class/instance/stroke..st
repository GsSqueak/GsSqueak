private
stroke: strokeColor 
	strokeColor ifNil: [^self].
	(strokeColor isKindOf: Symbol) 
		ifTrue: [^self paint: Color gray operation: #stroke	"punt"].
	strokeColor isSolidFill 
		ifTrue: [^self paint: strokeColor asColor operation: #stroke].
	self preserveStateDuring: 
			[:inner | 
			inner
				strokepath;
				fill: strokeColor]