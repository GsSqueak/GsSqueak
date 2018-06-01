sorting
makeThumbnailForPageNumber: pageNumber scaledToSize: sz default: aString

	| cachedData proj tn label |
	cachedData := listOfPages at: pageNumber.
	proj := Project named: cachedData first.
	(proj isNil or: [proj thumbnail isNil]) ifTrue: [
		cachedData size >= 2 ifTrue: [^cachedData second].
		tn := Form extent: sz depth: 8.
		tn fillColor: Color veryLightGray.
		label := (StringMorph contents: aString) imageForm.
		label displayOn: tn at: tn center - (label extent // 2) rule: Form paint.
		^tn
	].
	tn := proj thumbnail  scaledToSize: sz.
	cachedData size < 2 ifTrue: [
		cachedData := cachedData,#(0).
		listOfPages at: pageNumber put: cachedData.
	].
	cachedData at: 2 put: tn.
	^tn
