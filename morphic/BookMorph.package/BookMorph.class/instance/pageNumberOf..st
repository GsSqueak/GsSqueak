accessing
pageNumberOf: aMorph
  "Modified so that if the page IS in memory, other pages don't have to
	be brought in. (This method may wrongly say a page is not here if
	pages has a tombstone (MorphObjectOut) and that tombstone would
	resolve to an object already in this image. This is an unlikely case, and
	callers just have to tolerate it.)"

  ^ self pages identityIndexOf: aMorph