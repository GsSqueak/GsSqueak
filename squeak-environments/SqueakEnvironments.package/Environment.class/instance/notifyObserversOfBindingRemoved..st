updating
notifyObserversOfBindingRemoved: aBinding 
	observers
		do: [:ea | ea binding: aBinding removedFrom: self]