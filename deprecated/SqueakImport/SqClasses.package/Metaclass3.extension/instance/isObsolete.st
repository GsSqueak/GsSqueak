*SqClasses-testing
isObsolete
	"Return true if the receiver is obsolete"
	^destClass == nil "Either no destClass"
		or:[destClass class ~~ self "or I am not the class of destClass"
			or:[destClass isObsolete]] "or my instance is obsolete"
