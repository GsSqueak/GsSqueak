accessing
starRatio: r
"Set the star s.t. the ratio of the inner radius to the outer radius is r.
If r is > 1 use the reciprocal to keep the outer radius first."
"Assume we have at least one vertex.
set
All ways return a number <= 1.0"
self makeVertices: vertices size starRatio:( r > 1.0  ifTrue: [  r reciprocal ] ifFalse: [r ] ).