![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![version](https://img.shields.io/github/v/tag/baudee/pre-commit-dart?label=version)


# Dart pre-commit hook
A [pre-commit](http://pre-commit.com/) hook to follow the dart style guide.

Add the following in your `.pre-commit-config.yaml:

```
- repo: https://github.com/baudee/pre-commit-dart
  rev: v1.1.0
  hooks:
    - id: pre-commit-dart
```

You can also include or exclude files, by default it will only check files with the `.dart` extension:

```
- repo: https://github.com/baudee/pre-commit-dart
  rev: v1.1.0
  hooks:
    - id: pre-commit-dart
      files: lib/* 
      exclude: lib/generated/*
```

Finally, you can add some arguments to the pre-commit hook:
```
- repo: https://github.com/baudee/pre-commit-dart
  rev: v1.1.0
  hooks:
    - id: pre-commit-dart
      args: ['--line-length=120', '--dir=my_dir', '--actions=analyze,format']
```

List of the arguments:

| Argument | Description                                 | Default value |
| --- |---------------------------------------------| --- |
| `--line-length` | The line length that the formatter will use | `80` |
| `--dir` | The working directory                       | `.` |
| `--actions` | The actions to run, can be `analyze`, `format` or `test` | `analyze,format,test` |

Actions:
* format: runs `dart format` on the files, and adds them to the commit
* analyze: runs `dart analyze`, fails the commit if there are any warnigns or errors
* test: runs `dart test`, fails the commit if there are any failing tests
