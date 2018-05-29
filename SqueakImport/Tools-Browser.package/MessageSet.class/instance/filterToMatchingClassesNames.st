filtering
filterToMatchingClassesNames

	| reply |

	reply := UIManager default
					request: 'Type the string to match'
					initialAnswer: 'ClassName*'
					centerAt: Sensor cursorPoint.
	reply isEmptyOrNil ifTrue: [^ self].

	self filterFrom: [:aClass :aSelector | reply match: aClass name asString]
