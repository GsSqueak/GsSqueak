thumbnail cache
thumbnailForQuad: aQuint
	"Answer a thumbnail for a morph obtaining as per the quintuplet provided, creating the thumbnail if necessary.  If it is created afresh, it will also be cached at this time"
	^self thumbnailForQuad: aQuint color: Color transparent.