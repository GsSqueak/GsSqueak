file-services
serviceMergeLanguageTranslations
	"Answer a service for merging of translation files"
	^ SimpleServiceEntry
		provider: self
		label: 'merge the translation file'
		selector: #mergeTranslationFileNamed:
		description: 'merge the translation file into the language named like the file'
		buttonLabel: 'merge'