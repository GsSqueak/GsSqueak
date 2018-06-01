private
updateThumbnail
	"Update my thumbnail from my morph."

	| f scale scaleX scaleY shrunkF |
	contentsMorph ifNil: [thumbnail := nil. ^ self].
	f := contentsMorph imageForm.
	scaleX := MaxThumbnailWidthOrHeight asFloat / f height.
	scaleY := MaxThumbnailWidthOrHeight asFloat/ f width.
	scale := scaleX min: scaleY.  "choose scale that maintains aspect ratio"
	shrunkF := (f magnify: f boundingBox by: scale@scale smoothing: 2).
	thumbnail := Form extent: shrunkF extent depth: 8.  "force depth to be 8"
	shrunkF displayOn: thumbnail.
	contentsMorph allMorphsDo: [:m | m releaseCachedState].
