querying
fetchHierarchyTree: queryCode withElementsOfType: type

	^ self fetch: #Hierarchy -> (#Array -> {#Association -> {type . #Hierarchy}}) query: queryCode