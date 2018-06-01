private
outlineQuadraticBezierShape: vertices 
	| where |
	3
		to: vertices size
		by: 3
		do: [:i | 
			| v1 v2 v3 | 
			v1 := (vertices at: i - 2) roundTo: 0.001.
			v2 := (vertices at: i - 1) roundTo: 0.001.
			v3 := (vertices at: i) roundTo: 0.001.
			(v1 = v2
					or: [v2 = v3])
				ifTrue: [target lineto: v3]
				ifFalse: [target
						curvetoQuadratic: v3
						from: v1
						via: v2].
			where := v3].
	^where