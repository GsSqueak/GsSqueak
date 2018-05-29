as yet unclassified
doPrintPreview

	| pageDisplay sz |

	sz := (85 @ 110) * 3.
	self printSpecs landscapeFlag ifTrue: [
		sz := sz transposed
	].
	pageDisplay := BookMorph new
		color: Color paleYellow;
		borderWidth: 1.
	self allPages withIndexDo: [ :each :index | | pic align newPage subBounds |
		pic := ImageMorph new image: (each pageThumbnailOfSize: sz).
		align := AlignmentMorph newColumn
			addMorph: pic;
			borderWidth: 1;
			layoutInset: 0;
			borderColor: Color blue.
		newPage := pageDisplay 
			insertPageLabel: 'Page ',index printString
			morphs: {align}.
		subBounds := newPage boundingBoxOfSubmorphs.
		newPage extent: subBounds corner - newPage topLeft + ((subBounds left - newPage left)@0).
	].
	pageDisplay 
		goToPage: 1;
		deletePageBasic;
		position: Display extent - pageDisplay extent // 2;
		openInWorld.
