objects from disk
convertToCurrentVersion: varDict refStream: smartRefStrm
	"If we're reading in an old version with a pixelSize instance variable, convert it to a point size."

	"Deal with the change from pixelSize to pointSize, assuming the current monitor dpi."
	varDict at: 'pixelSize' ifPresent: [ :x | 
		pointSize := (TextStyle pixelsToPoints: x) rounded.
	].
	^super convertToCurrentVersion: varDict refStream: smartRefStrm.