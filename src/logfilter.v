// Print file lines that start with "DEBUG:"
import os

// `read_file` returns an optional (`?string`), it must be checked
text := os.read_file('app.log') or {
	// `err` is a special variable that contains the error
	// in `or {}` blocks
	eprintln('failed to read the file: ${err}')
	return
}

lines := text.split_into_lines()
for line in lines {
	if line.starts_with('DEBUG:') {
		println(line)
	}
}
