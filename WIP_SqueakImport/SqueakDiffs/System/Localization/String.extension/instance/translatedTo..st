*System-Localization
translatedTo: localeID 
	"answer the receiver translated to the given locale id"
	^ self translatedTo: localeID inDomain: (TextDomainManager domainOfMethod: thisContext sender method).