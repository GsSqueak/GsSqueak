remove
removeMissingClasses
	"Remove any class names that are no longer in the Smalltalk dictionary. Used for cleaning up after garbage collecting user-generated classes."
	"SystemOrganization removeMissingClasses"

	elementArray copy do: [:el |
		(Smalltalk includesKey: el) ifFalse: [self removeElement: el]].
