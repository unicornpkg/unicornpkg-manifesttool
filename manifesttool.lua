#!/usr/bin/env lua
local json = require("cjson")
local lfs = require("lfs") -- require the lfs library

local params = { ... }

local manifest = {}
manifest.spec = "unicornpkg-1.1.0"
manifest.packages = {}

-- use lfs to get a list of files in a directory
for file in lfs.dir(params[1]) do
	if file ~= "." and file ~= ".." and string.sub(file, -4) == ".lua" then -- ignore the '.' and '..' entries
		local file_path = params[1] .. "/" .. file
		if lfs.attributes(file_path, "mode") ~= "link" then -- ignore symbolic links
			local package_table = dofile(file_path)
			if package_table.name and package_table.version then
				manifest.packages[package_table.name] = package_table.version
			elseif not package_table.version then
				manifest.packages[package_table.name] = json.null
			end
		end
	end
end

local manifest = json.encode(manifest)

io.write(manifest)
