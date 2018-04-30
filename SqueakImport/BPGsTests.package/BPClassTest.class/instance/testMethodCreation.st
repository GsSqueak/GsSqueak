as yet unclassified
testMethodCreation
  | testClass |
  testClass := self convenienceCreateTestClass: 'MethodCreationTestClass'.
testClass @env7: compile: 'foo2 ^ 5' classified: 'asdf' withStamp: nil notifying: nil.