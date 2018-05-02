initialization
newPages: pageList currentIndex: index
  "Replace all my pages with the given list of BookPageMorphs. Make the
	current page be the page with the given index."

  self pages: self pages species new.
  self pages addAll: pageList.
  self pages isEmpty
    ifTrue: [ ^ self insertPage ].
  self goToPage: index