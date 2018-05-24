as yet unclassified
fromTsv
  | parser |
  Names := Bag new: 8611520.
  commitCtr := 0.
  parser := NeoCSVReader on: self file.
  parser separator: Character tab.
  parser next.	"skip headline"
  parser
    do: [ :line | 
      Names
        add:
          (self
            newWithNconst: (line at: 1)
            primaryName: (line at: 2)
            birthYear: ((line at: 3) ifNotNil: [ (line at: 3) asInteger ])
            deathYear: ((line at: 4) ifNotNil: [ (line at: 4) asInteger ])
            primaryProfession: (line at: 5)
            knownForTitles: (line at: 6)).
      self lacyCommit ]