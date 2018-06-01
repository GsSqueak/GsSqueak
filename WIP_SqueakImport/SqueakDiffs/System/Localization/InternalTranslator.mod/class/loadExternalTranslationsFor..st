private loading
loadExternalTranslationsFor: translator
	"Try to load translations from external external files.
	The files are located in the <prefs>/locale/<language>{/<country>} folder.
	There can be more than one file for each location, so applications can install their own partial translation tables. All files in the specific folder are loaded."

	| translationDir |
	translationDir := self directoryForLocaleID: translator localeID create: false.
	translationDir ifNil: [ ^nil ]. 
	(translationDir fileNamesMatching: '*.' , self translationSuffix)
		do: [:fileName | translator loadFromFileNamed: (translationDir fullNameFor: fileName)]