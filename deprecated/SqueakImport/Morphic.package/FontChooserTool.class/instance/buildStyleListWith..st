toolbuilder
buildStyleListWith: builder
	"Build the font choosers list of font styles"
	| listSpec |
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		list: #fontStyleList; 
		getIndex: #selectedFontStyleIndex; 
		setIndex: #selectedFontStyleIndex:.
	^listSpec
