private
putProjectDetailsFrom: aProject to: args 
	| projectDetails |
	projectDetails := aProject world
				valueOfProperty: #ProjectDetails
				ifAbsent: [^ self].
	""
	self flag: #todo.
	"projectname ?"
	projectDetails
		at: 'projectdescription'
		ifPresent: [:value | args at: 'description' put: {value isoToSqueak}].
	projectDetails
		at: 'projectauthor'
		ifPresent: [:value | args at: 'author' put: {value isoToSqueak}].
	projectDetails
		at: 'projectcategory'
		ifPresent: [:value | args at: 'category' put: {value isoToSqueak}].
	projectDetails
		at: 'projectsubcategory'
		ifPresent: [:value | args at: 'subcategory' put: {value isoToSqueak}].
	projectDetails
		at: 'projectkeywords'
		ifPresent: [:value | args at: 'keywords' put: {value isoToSqueak}]