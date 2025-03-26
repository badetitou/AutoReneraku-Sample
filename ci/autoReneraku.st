| auto critics prNumber url classesNames classes methods filesNames |

filesNames := ((Smalltalk os environment at: 'changed_files') splitOn: ' ').
classesNames := filesNames collect: [ :file |  ((file splitOn: '/') last splitOn: '.') first ].
classes := classesNames collect: [ :className | Smalltalk classNamed: className ].
methods := (classes reject: [:clazz | clazz isNil "in case class is not found" ]) flatCollect: [:clazz | clazz methods ].

methods do: [ :aMethod | | data projectName |
    projectName := ((Smalltalk os environment at: 'GITHUB_REPOSITORY') splitOn: '/') last.
    auto := AutoReneraku new.
    auto projectName: 'AutoReneraku-Sample'.
    auto token: (Smalltalk os environment at: 'PAT').
    data := Dictionary new.
    auto fillData: data withNewMethodData: aMethod.
    data at: 'commit_id' put: (Smalltalk os environment at: 'COMMIT_SHA').
    prNumber := (Smalltalk os environment at: 'PULL_REQUEST_NUMBER').
    url := 'https://api.github.com/repos/', (Smalltalk os environment at: 'GITHUB_REPOSITORY'), '/pulls/', prNumber, '/comments'.
    Stdio stderr << data printString.
    Stdio stderr << ((auto post: url contents: data) at: #status)printString.
]
