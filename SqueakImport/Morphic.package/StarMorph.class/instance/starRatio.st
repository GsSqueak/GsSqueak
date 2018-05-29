access
starRatio
"Return the ratio of the inner radius to the outer radius."
"Assume we have at least one vertex.
All ways return a number <= 1.0"
| r c |
c := vertices average rounded .
r := (c dist: vertices last) / (c dist:  vertices first)  .
^ r > 1.0  ifTrue: [  r reciprocal ] ifFalse: [r ] .