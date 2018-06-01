updating
notifyObserversOfBindingAdded: aBinding 
	observers
		do: [:ea | ea binding: aBinding addedTo: self]