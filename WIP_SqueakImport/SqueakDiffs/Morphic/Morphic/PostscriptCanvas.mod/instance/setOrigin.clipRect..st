balloon compatibility
setOrigin: aPoint clipRect: aRectangle
	self comment:'new origin: ' with:aPoint.
	target rectclip:aRectangle.
	self translate:aPoint - origin.

"	self grestore; gsave.

	self write:aRectangle.
	target print:' textclip'; cr.
	target print:'% new offset '.
	target write:aPoint.
	target cr.
"	super setOrigin: aPoint clipRect: aRectangle.
