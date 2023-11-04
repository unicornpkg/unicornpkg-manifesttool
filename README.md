# `unicornpkg-manifesttool`

Creates a manifest file for remotes that is compliant with v1.1.0 of the Unicornpkg specification.

## Installation

Clone the repository, install `cjson` and `luafilesystem` through LuaRocks.

## Usage

Assuming you have a package remote somewhere on your machine:

```
REMOTE_LOCATION=../unicornpkg-main # or some other location, absolute or relative
lua manifesttool.lua $REMOTE_LOCATION > unicornpkg.remote.json
```

### Diff-friendly version

Here's a diff-friendly version, helped along by `jq`. This ensures diffs are minimal by expanding it to use newlines, as well as sorting keys.

This likely has a large impact when repositories grow to a large size.

```sh
REMOTE_LOCATION=../unicornpkg-main # or some other location, absolute or relative
lua manifesttool.lua $REMOTE_LOCATION | jq --sort-keys > unicornpkg.remote.json
```
