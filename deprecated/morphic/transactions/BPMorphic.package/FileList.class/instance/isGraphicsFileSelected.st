private
isGraphicsFileSelected
	^ fileName notNil
		and: [(self itemsForFile: self fullName)
				anySatisfy: [:each | each provider == Form
						and: [each selector == #importImage:]]]