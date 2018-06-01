as yet unclassified
newPin
	"Construct a pin for embedded attachment"
	"CircleMorph newPin openInHand"
	^self new
		removeAllMorphs;
		extent: 18@18;
		hResizing: #rigid;
		vResizing: #rigid;
		layoutPolicy: nil;
		color: Color orange lighter;
		borderColor: Color orange darker;
		borderWidth: 2;
		wantsConnectionWhenEmbedded: true;
		name: 'Pin'