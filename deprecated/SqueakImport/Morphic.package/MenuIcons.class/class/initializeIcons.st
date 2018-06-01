class initialization
initializeIcons
	"self initialize"
	| methods |
	Icons := IdentityDictionary new.
	methods := self class selectors
				select: [:each | '*Icon' match: each asString].
	methods
		do: [:each | Icons
				at: each
				put: (MenuIcons perform: each)].
	self initializeTranslations.
