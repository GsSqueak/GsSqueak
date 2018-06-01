private
initKnownEnvironments
	"LanguageEnvironment initKnownEnvironments"
	| _gsSqueakTemp_known |
	_gsSqueakTemp_known := Dictionary new.
	self
		allSubclassesDo: [:subClass | subClass supportedLanguages
				do: [:language | 
					| id env |
					env := subClass new.
					id := LocaleID isoString: language.
					env localeID: id.
					_gsSqueakTemp_known at: id put: env]].
	^ _gsSqueakTemp_known