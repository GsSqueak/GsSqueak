images
createArrowOfDirection: aSymbolDirection size: size color: aColor 
	"PRIVATE - create an arrow with aSymbolDirectionDirection, finalSizeInteger and aColor  
	aSymbolDirectionDirection = #top, #bottom. #left or #right  
	 ScrollBar initializeImagesCache.
	Try with: 
	(ScrollBar createArrowOfDirection: #right size: 14 color: Color lightGreen) asMorph openInHand."
	
	| form canvas vertices margin |
	form := Form extent: size asPoint depth: 32.
	canvas := form getCanvas.
	margin := size < 14 ifTrue: [2] ifFalse: [3].
	vertices := {
		size // 2 @ margin.
		size asPoint - margin asPoint.
		margin @ (size-margin).
		size // 2 @ margin}.
	
	"Preferences gradientScrollBars
		ifTrue: [
			fillStyle := GradientFillStyle ramp: {
					0.0 -> (aColor adjustBrightness: 0.5).
					0.1-> (aColor adjustBrightness: 0.05).
					0.6 -> (aColor darker)}.
			fillStyle origin: size // 2 @ margin.
			fillStyle direction: 0 @ size]
		ifFalse: [
			fillStyle := SolidFillStyle color: aColor]. "
	
	canvas
		drawPolygon: vertices
		fillStyle: (SolidFillStyle color: aColor).
	
	^ (form rotateBy: (aSymbolDirection caseOf: {
		[#top] -> [0].
		[#bottom] -> [180].
		[#left] -> [270].
		[#right] -> [90]})) clippedToSize: size asPoint