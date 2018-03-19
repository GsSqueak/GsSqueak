-MorphicExtras-accessing
highlightOnlySubmorph: aMorph 
	"Distinguish only aMorph with border highlighting (2-pixel wide red);
	make all my other submorphs have one-pixel-black highlighting. This
	is a rather special-purpose and hard-coded highlighting regime, of
	course. Later, if someone cared to do it, we could parameterize the
	widths and colors via properties, or some such."
	self submorphs
		do: [:m | m == aMorph
				ifTrue: [m borderWidth: 1;
						 borderColor: Color red.
					m firstSubmorph color: Color red]
				ifFalse: [m borderWidth: 1;
						 borderColor: Color black.
					m firstSubmorph color: Color black]]