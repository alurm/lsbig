lsbig(1)

# NAME

lsbig - show large files in a directory with their sizes

# SYNOPSIS

*lsbig* [_directory_]

# DESCRIPTION

The lsbig tool shows large files in a directory with their sizes. "Large" files are bigger than two mebibytes.

Default directory is the current directory. It can be overridden by an optional argument.

# BUGS

Paths with newlines are handled incorrectly. Exabyte (and larger) sizes may be reported incorrectly.

# SEE ALSO

_ls_(1), _du_(1)

# AUTHORS

Maintained by Alan Urmancheev <alan.urman@gmail.com>.

