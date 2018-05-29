filtering
filterToPackage

	| packages selectedIndex selectedPackage |

	packages := (PackageOrganizer default packages sort: [ :a :b |
		a packageName <= b packageName ]).

	selectedIndex := UIManager default chooseFrom: (packages collect:[:each | each packageName]) lines: #() title: 'Select a package...'.
	selectedIndex isZero ifTrue:[^ self].

	selectedPackage := packages at: selectedIndex.
	self filterFrom: [:aClass :aSelector | selectedPackage includesMethod: aSelector ofClass: aClass ]
