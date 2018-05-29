menus
lessVertices
"Reduce the number of points by one until we are  a diamond. If odd reduce the number of sides by two until we become a triangle. See class comment."
	| nVerts |
	( nVerts := 2 negated + vertices size) < 3 ifFalse: [
	self
		makeVertices: nVerts]