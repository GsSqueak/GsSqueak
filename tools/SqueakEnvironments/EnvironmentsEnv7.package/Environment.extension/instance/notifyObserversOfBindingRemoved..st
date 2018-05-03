*EnvironmentsEnv7-updating
notifyObserversOfBindingRemoved: aBinding 
	observers
		do: [:ea | ea binding: aBinding removedFrom: self]
