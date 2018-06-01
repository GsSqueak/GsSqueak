toolbuilder
buildFontListWith: builder
	"Build the font choosers list of font names"
	| listSpec |
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		name: #fontList;
		list: #fontList; 
		getIndex: #selectedFontIndex; 
		setIndex: #selectedFontIndex:.
	^listSpec
	