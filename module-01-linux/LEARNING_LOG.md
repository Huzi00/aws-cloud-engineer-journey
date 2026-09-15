## Day 1 Log - Filesystem & Navigation

- **Built:** Initial repo directory structure, module-01-linux environment, and basic files.
- **Commands Learned:** pwd, ls -la, cd, mkdir, touch, cp, mv, rm -rf.
- **Key Concept:** Absolute paths start from root (/), while relative paths start from the current directory (./ or ../).
- **Errors/Fixes:** Practiced navigating and manipulating files entirely inside the CLI without a GUI.

## Day 2 Log - File Permissions & Users

- **Built:** Hands-on validation of Linux file permissions and shell script execution privileges.
- **Commands Learned:** chmod, chown, sudo, ls -l, u+x, octal notation (755, 600, 644).
- **Key Concept:** `rwx` translates to Read (4), Write (2), and Execute (1). Permissions apply to User, Group, and Others.
- **Errors/Fixes:** Executed script without `+x` privileges to observe the "Permission denied" error and resolved it using `chmod`.

## Day 3 Log - Text Processing, Piping & Redirects

- **Built:** Hands-on log manipulation, text filtering, and command output chaining.
- **Commands Learned:** cat, grep, head, tail, wc, sort, `|` (pipe), `>` (overwrite), `>>` (append).
- **Key Concept:** Redirection (`>`) controls where output goes (file vs stdout), while piping (`|`) feeds the stdout of one command directly into the stdin of another.
- **Errors/Fixes:** Practiced avoiding accidental file overwrites by distinguishing `>` from `>>`.

## Day 4 Log - Process Management & SSH

- **Built:** Process monitoring, background execution management, and SSH key pair generation.
- **Commands Learned:** ps, top, kill, jobs, bg, fg, ssh-keygen, cat ~/.ssh/*.pub.
- **Key Concept:** Private keys must never leave your local system; public keys are installed on remote servers to grant secure access without passwords.
- **Errors/Fixes:** Practiced terminating background processes cleanly using job control IDs (`kill %1`).