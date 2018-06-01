-Etoys-card in a stack
holdsSeparateDataForEachInstance
	"Answer whether the receiver is currently behaving as a 'background
	field', i.e., whether it is marked as shared (viz. occurring on the
	background of a stack) *and* is marked as holding separate data for
	each instance"
	^ self isShared
		and: [self hasProperty: #holdsSeparateDataForEachInstance]