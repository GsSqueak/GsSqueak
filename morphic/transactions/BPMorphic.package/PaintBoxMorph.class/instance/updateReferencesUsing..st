copying
updateReferencesUsing: aDictionary 
	"Fix up stampHolder which is a ScrollingToolHolder, which is not a
	Morph "
	super updateReferencesUsing: aDictionary.
	stampHolder updateReferencesUsing: aDictionary.
	colorMemory updateReferencesUsing: aDictionary