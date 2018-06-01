private
outlinePolygon: vertices 
	target moveto: (vertices first).
	2 to: vertices size do: [:i | target lineto: (vertices at: i)].
	target closepath