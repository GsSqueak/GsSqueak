helpers
codeForGettingAllClassesInCategory: category

	^ 'ClassOrganizer cachedOrganizer categories at: #''' , category , ''' ifAbsent: [#()]'