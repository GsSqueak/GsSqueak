helpers
codeForGettingAllClassesInCategory: category

	^ 'ClassOrganizer new categories at: #''' , category , ''' ifAbsent: [#()]'