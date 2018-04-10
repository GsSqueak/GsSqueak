accessing
hasIcon
	"Answer whether the receiver has an icon. If menues without icons are
	requested, pretend to not bear one unless we have not content."
	^ self icon notNil
		and: [Preferences menuWithIcons
				or: [self contents isEmptyOrNil]]