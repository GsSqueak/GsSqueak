translation
translateWithoutLoading: aString toLocaleID: localeID
	"translate for default domain"
	^self translateWithoutLoading: aString toLocaleID: localeID inDomain: TextDomainManager defaultDomain.
