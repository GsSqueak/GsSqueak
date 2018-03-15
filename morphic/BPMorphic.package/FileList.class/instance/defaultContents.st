private
defaultContents
	contents := list == nil
				ifTrue: [String new]
				ifFalse: [String
						streamContents: [:s | 
							s nextPutAll: 'NO FILE SELECTED' translated;
								 cr.
							s nextPutAll: '  -- Folder Summary --' translated;
								 cr.
							list
								do: [:item | s nextPutAll: item;
										 cr]]].
	brevityState := #FileList.
	^ contents