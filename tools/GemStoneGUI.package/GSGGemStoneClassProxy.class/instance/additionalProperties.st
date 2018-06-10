additional properties
additionalProperties

	^ additionalProperties ifNil: [additionalProperties := self fetchAdditionalProperties]