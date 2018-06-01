drawing
drawHighResolutionOn: aCanvas in: aRectangle

	| r finalClipRect scale sourceOrigin sourceExtent sourceRect biggerSource biggerDestExtent interForm offsetInBigger |

	r := aRectangle translateBy: aCanvas origin.
	finalClipRect := r intersect: (aCanvas clipRect translateBy: aCanvas origin).
	self canBeEnlargedWithB3D ifTrue: [
		(WarpBlt toForm: aCanvas form)
			clipRect: finalClipRect;
			sourceForm: originalForm;
			cellSize: 2;  "installs a colormap"
			combinationRule: Form paint;

			copyQuad: originalForm boundingBox innerCorners 
			toRect: r.
		^self
	].
	scale := aRectangle extent / originalForm extent.
	sourceOrigin := originalForm offset + (aCanvas clipRect origin - aRectangle origin / scale).
	sourceExtent := aCanvas clipRect extent / scale.
	sourceRect := sourceOrigin rounded extent: sourceExtent rounded.
	biggerSource := sourceRect expandBy: 1.
	biggerDestExtent := (biggerSource extent * scale) rounded.
	offsetInBigger := (sourceOrigin - biggerSource origin * scale) rounded.

	interForm := Form extent: biggerDestExtent depth: aCanvas depth.
	(originalForm copy: biggerSource)
		displayInterpolatedIn: interForm boundingBox
		on: interForm.
	aCanvas 
		drawImage: interForm 
		at: aCanvas clipRect origin 
		sourceRect: (offsetInBigger extent: aCanvas clipRect extent).


