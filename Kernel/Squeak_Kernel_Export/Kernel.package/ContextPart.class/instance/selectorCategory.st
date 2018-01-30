accessing
selectorCategory
	"Answer the category to which this message belongs (relative to the receiver).
	 If no superclass categorises this message, use the default."
	| rcvrClass organizers |
	rcvrClass := self objectClass: self receiver.
	organizers := rcvrClass withAllSuperclasses collect: [:ea | ea organization].
	organizers addFirst: rcvrClass organization.
	^(organizers collect: [ :org | org categoryOfElement: self selector])
			detect: [:ea | ea ~= ClassOrganizer default and: [ea ~= nil]]
			ifNone: [ClassOrganizer default]