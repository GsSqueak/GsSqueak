toolbuilder
buildFontListWith: builder
	"Build the font choosers list of font names"
	
	^ builder pluggableTreeSpec new
		model: self;
		roots: #allFonts; 
		label: #labelOf: ;
		getChildren: #childrenOf: ;
		getSelected: #currentSelection;
		setSelected: #currentSelection:;
		setSelectedParent: #currentParent:;
		menu: #fontListMenu:;
		autoDeselect: false;
		yourself
