*Morphic-MorphicExtras-private
migrateSystem
	"Locale migrateSystem"
	"Do all the necessary operations to switch to the new Locale environment."

	LocaleChangeListeners := nil.
	self
		addLocalChangedListener: HandMorph;
		addLocalChangedListener: Clipboard;
		addLocalChangedListener: Vocabulary;
		addLocalChangedListener: PartsBin;
		addLocalChangedListener: Project;
		addLocalChangedListener: PaintBoxMorph;
		yourself