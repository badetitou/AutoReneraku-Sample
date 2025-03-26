| auto critics prNumber url classesNames classes methods filesNames projectName critiques |

projectName := ((Smalltalk os environment at: 'GITHUB_REPOSITORY') splitOn: '/') last.
Stdio stderr << 'project name: '<< projectName printString.

(IceRepositoryCreator new
	location: '.' asFileReference;
	subdirectory: 'src';
	createRepository) name:projectName;
        register.


filesNames := ((Smalltalk os environment at: 'changed_files') splitOn: ' ').
classesNames := filesNames collect: [ :file |  ((file splitOn: '/') last splitOn: '.') first ].
classes := classesNames collect: [ :className | Smalltalk classNamed: className ].
methods := (classes reject: [:clazz | clazz isNil "in case class is not found" ]) flatCollect: [:clazz | clazz methods ].

auto := AutoReneraku new.
auto projectName: projectName.
auto token: (Smalltalk os environment at: 'PAT').
methods do: [:method | 
    auto autoRenerakuMethod: method
]

"critiques := methods collect: [ :m | m -> (m critiques select: [ :cr | cr providesChange ]) ] as: Dictionary.
critiques := critiques select: [ :val | val isNotEmpty ].
critiques associations do: [ :assoc | assoc value anyOne change execute ].


Stdio stderr << IceRepository registry printString.

critiques associations do: [ :assoc | | data |
    auto := AutoReneraku new.
    auto projectName: projectName.
    auto token: (Smalltalk os environment at: 'PAT').
    Stdio stderr << 'fill for: ' << assoc key printString.
    data := Dictionary new.
    auto fillData: data withNewMethodData: assoc key.
    data at: 'commit_id' put: (Smalltalk os environment at: 'COMMIT_SHA').
    prNumber := (Smalltalk os environment at: 'PULL_REQUEST_NUMBER').
    url := 'https://api.github.com/repos/', (Smalltalk os environment at: 'GITHUB_REPOSITORY'), '/pulls/', prNumber, '/comments'.
    Stdio stderr << data printString.
    Stdio stderr << String crlf.
    Stdio stderr << (auto post: url contents: data) printString.
    Stdio stderr << String crlf.
]
"