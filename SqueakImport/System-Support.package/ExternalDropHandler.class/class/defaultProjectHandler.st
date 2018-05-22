private
defaultProjectHandler
	^ ExternalDropHandler
		type: nil
		extension: 'pr'
		action: [:stream | ProjectLoading openOn: stream]