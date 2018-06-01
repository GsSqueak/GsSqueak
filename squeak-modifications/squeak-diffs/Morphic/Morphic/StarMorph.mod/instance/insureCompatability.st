initialization
insureCompatability
"The old stars had the point on the second not the first vertex. So we need to check for this special case."
 | c v1 v2 |
c := vertices average rounded.
 v1 := vertices first .
 v2 := vertices second .
(c dist: v1) + 0.001 < (c dist: v2) ifTrue: [vertices := vertices allButFirst copyWith: v1]

