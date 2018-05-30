access
skipRatios
"Return an array of  ratios  of the inner radius to the outer radius.
Ratios are in ascending order from 0.0 to 1.0."
"Assume we have at least one vertex.
All ways return a number <= 1.0"

| n  alpha  |
"Odd vertices sizes can not be stars only regular polygons"
n:= vertices size . n odd ifTrue: [ ^ #(  1.0) ] .

alpha := Float pi / (n//2)  asFloat .

^ ((((    Float halfPi -alpha  to: alpha /2.0  by: alpha  negated ) 
	collect:  [:angle |( (angle) sin )/
					(angle + alpha ) sin ]
	) copyWith: 0.0) copyWithFirst: 1.0) reversed .