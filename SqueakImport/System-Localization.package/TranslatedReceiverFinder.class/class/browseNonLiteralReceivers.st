utilities
browseNonLiteralReceivers
	"TranslatedReceiverFinder browseNonLiteralReceivers"
	SystemNavigation default
		browseMessageList: self new nonLiteralReceivers
		name: 'Non literal receivers of #translated'
		autoSelect: 'translated'