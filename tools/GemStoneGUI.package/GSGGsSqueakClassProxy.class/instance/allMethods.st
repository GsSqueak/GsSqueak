interface 2
allMethods

	| query |
	query := '
		| methods |
		methods := OrderedCollection new.
		{1} env: {2} methodsDo: [:selector :method | methods add: method].
		methods'
			format: {
				self codeReferencingMe.
				self environmentId}.
	^ self fetchMethods: query