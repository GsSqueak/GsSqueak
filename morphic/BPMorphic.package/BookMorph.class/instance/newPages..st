initialization
newPages: pageList
  "Replace all my pages with the given list of BookPageMorphs. After this
	call, currentPage may be invalid."

  self pages: self pages species new.
  self pages addAll: pageList