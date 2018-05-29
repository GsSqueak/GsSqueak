testing
showQueryAsPVM: resultStream
	| answer gif whatToShow projectName fileName firstURL wrapper currX currY maxX maxY rawProjectName |
"SuperSwikiServer testOnlySuperSwiki queryProjectsAndShow"

	resultStream reset; nextLine.
	answer := RectangleMorph new
		useRoundedCorners;
		borderWidth: 0;
		borderColor: Color blue;
		color: Color paleBlue.
	currX := currY := maxX := maxY := 10.
	[resultStream atEnd] whileFalse: [
		rawProjectName := resultStream nextLine.
		projectName := rawProjectName convertFromEncoding: self encodingName.
		fileName := resultStream nextLine convertFromEncoding: self encodingName.
		gif := self oldFileOrNoneNamed: rawProjectName,'.gif'.
		gif ifNotNil: [gif := GIFReadWriter formFromStream: gif].
		currX > 600 ifTrue: [
			currX := 10.
			currY := maxY + 10.
		].
		gif ifNil: [
			gif := AlignmentMorph newColumn
				hResizing: #shrinkWrap;
				vResizing: #shrinkWrap;
				borderWidth: 8;
				borderColor: Color red;
				color: Color lightRed;
				addMorph: (StringMorph contents: 'No GIF for ',projectName);
				fullBounds;
				imageForm
		].
		firstURL := self url.
		firstURL last == $/ ifFalse: [firstURL := firstURL, '/'].

		whatToShow := ProjectViewMorph new
			image: (gif asFormOfDepth: Display depth);
			lastProjectThumbnail: gif;
			setProperty: #SafeProjectName toValue: projectName;
			project: (DiskProxy 
				global: #Project 
				selector: #namedUrl: 
				args: {firstURL,fileName}
			).

		answer addMorphBack: (whatToShow position: currX @ currY).
		currX := currX + whatToShow width + 10.
		maxX := maxX max: currX.
		maxY := maxY max: currY + whatToShow height.
	].
	maxX = 10 ifTrue: [
		^self inform: 'No projects found for your criteria'
	].
	answer extent: (maxX @ maxY) + (0@10).
	wrapper := ScrollPane new extent: (answer width + 10) @ (answer height min: 400).
	wrapper color: Color white.
	wrapper scroller addMorph: answer.
	wrapper
		openCenteredInWorld;
		useRoundedCorners;
		setScrollDeltas.