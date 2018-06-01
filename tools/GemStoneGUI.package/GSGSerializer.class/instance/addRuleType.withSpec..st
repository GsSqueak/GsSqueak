resolution
addRuleType: type withSpec: description

	self rules
		at: type
		ifPresent: [:existingDescription |
			existingDescription ~= description ifTrue: [
				self error: 'Tried to define rule twice with different meanings']]
		ifAbsent: [
			self rules at: type put: description.
			self resolveDescription: description]