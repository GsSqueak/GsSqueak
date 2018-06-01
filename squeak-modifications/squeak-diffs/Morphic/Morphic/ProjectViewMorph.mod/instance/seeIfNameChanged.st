events
seeIfNameChanged

	| nameBefore nameNow |

	nameBefore := self valueOfProperty: #SafeProjectName ifAbsent: ['???'].
	nameNow := self safeProjectName.
	(submorphs notEmpty and: [nameBefore = nameNow]) ifTrue: [^self].
	self addProjectNameMorphFiller.
