A package browser represents a hierarchical query path through an organization of class and method information.   It parses class categories into a two-level hierarchy on the first '-' character, giving "packages" (e.g.,  Magnitude, Collections, Graphics, etc.), and "categories" (e.g., Magnitude-General and Magnitude-Number).

Instance Variables:
	package  <Symbol> the "category header," e.g., #Magnitudes or #Collections
	packageListIndex <Integer> The index in the package list
	packageList  <OrderedCollection of String> the list of package names
