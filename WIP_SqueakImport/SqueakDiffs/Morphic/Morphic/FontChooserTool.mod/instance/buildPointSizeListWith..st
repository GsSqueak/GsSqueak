toolbuilder
buildPointSizeListWith: builder
	"Build the font choosers list of point sizes"
	| listSpec |
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		list: #pointSizeList; 
		getIndex: #selectedPointSizeIndex; 
		setIndex: #selectedPointSizeIndex:.
	^listSpec
