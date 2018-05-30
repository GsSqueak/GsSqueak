class list
selectedClassOrMetaClass
	"Answer the currently selected class (or metaclass)."
	self hasMessageSelected ifFalse: [^nil].
	self setClassAndSelectorIn: [:c :s | ^c]