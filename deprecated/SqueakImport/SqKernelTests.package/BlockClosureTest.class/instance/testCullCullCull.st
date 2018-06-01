tests - evaluating
testCullCullCull
	self assert: nil equals: ([ ] cull: 1 cull: 2 cull: 3).

	self assert: nil equals: ([ :x | ] cull: 1 cull: 2 cull: 3).
	self assert: 1 equals: ([ :x | x ] cull: 1 cull: 2 cull: 3).

	self assert: nil equals: ([ :x :y | ] cull: 1 cull: 2 cull: 3).
	self assert: 1 equals: ([ :x :y | x ] cull: 1 cull: 2 cull: 3).
	self assert: 2 equals: ([ :x :y | y ] cull: 1 cull: 2 cull: 3).

	self assert: nil equals: ([ :x :y :z | ] cull: 1 cull: 2 cull: 3).
	self assert: 1 equals: ([ :x :y :z | x ] cull: 1 cull: 2 cull: 3).
	self assert: 2 equals: ([ :x :y :z | y ] cull: 1 cull: 2 cull: 3).
	self assert: 3 equals: ([ :x :y :z | z ] cull: 1 cull: 2 cull: 3).

	self should: [ [ :x :y :z :a | ] cull: 1 cull: 2 cull: 3 ] raise: Error.
	self should: [ [ :x :y :z :a :b | ] cull: 1 cull: 2 cull: 3 ] raise: Error.
	self assert: ([ 0 ] cull: 1 cull: 2 cull: 3) = 0.
	self assert: ([ :x | x ] cull: 1 cull: 2 cull: 3) = 1.
	self assert: ([ :x :y | y ] cull: 1 cull: 2 cull: 3) = 2.
	self assert: ([ :x :y :z | z ] cull: 1 cull: 2 cull: 3) = 3.	