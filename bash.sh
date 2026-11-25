
#!/usr/bin/env bash

set -euo pipefail

# Git Practice Repository Setup
REPO_DIR="${1:-git-practice}"
REMOTE_URL="${2:-}"

echo "Starting Git practice repository setup..."

# Check Git installation
if ! command -v git >/dev/null 2>&1; then
    echo "Error: Git is not installed."
    exit 1
fi

# Prevent accidental overwriting
if [[ -e "$REPO_DIR" ]] && [[ -n "$(ls -A "$REPO_DIR" 2>/dev/null)" ]]; then
    echo "Error: $REPO_DIR already exists and is not empty."
    exit 1
fi

mkdir -p "$REPO_DIR"
cd "$REPO_DIR"

# Initialize repository
git init -b main

# Configure Git identity
git config user.name "Samuel Ogundoju"
git config user.email "ogundojusamuel@gmail.com"

# Create initial notes
echo "My Git practice" > notes.txt

git status
git add notes.txt
git status
git commit -m "Add practice notes"

# Update notes
echo "I am learning to use Git." >> notes.txt

git add notes.txt
git diff --staged
git commit -m "Expand practice notes"

# Review commit history
git log --oneline
git status

# Create feature branch
git switch -c add-goal

echo "Goal: use Git with confidence." >> notes.txt

git add notes.txt
git commit -m "Add a learning goal"

# Return to main and merge
git switch main
cat notes.txt

git merge add-goal

cat notes.txt

# Review branch history
git log --oneline --graph --all

# Copy this setup script into the repository
SCRIPT_SOURCE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"

if [[ -f "$SCRIPT_SOURCE" ]]; then
    cp "$SCRIPT_SOURCE" setup-git-practice.sh
    chmod +x setup-git-practice.sh
fi

# Create changelog
cat > CHANGELOG.md <<'EOF'
# Changelog

## Initial Git Practice Setup

- Initialized repository with main as the default branch.
- Configured Git username and email.
- Created notes.txt.
- Added and committed initial practice notes.
- Expanded practice notes and committed the update.
- Created the add-goal feature branch.
- Added a learning goal.
- Merged add-goal into main.
- Added the Bash setup automation script.
- Added repository progress documentation.
EOF

# Create progress tracker
cat > PROGRESS.md <<'EOF'
# Git Practice Progress

## Completed Activities

- [x] Create a Git repository.
- [x] Initialize the main branch.
- [x] Configure Git identity.
- [x] Create and track notes.txt.
- [x] Stage files and inspect changes.
- [x] Create commits.
- [x] Review commit history.
- [x] Create a feature branch.
- [x] Make changes on a feature branch.
- [x] Switch between branches.
- [x] Merge a feature branch into main.
- [x] Review Git history using graph mode.
- [x] Create a Bash automation script.
- [x] Document repository changes and progress.

## Next Activities

- [ ] Connect to a GitHub remote repository.
- [ ] Push main to GitHub.
- [ ] Practise git pull and git fetch.
- [ ] Practise resolving merge conflicts.
EOF

# Commit script and documentation
git add setup-git-practice.sh CHANGELOG.md PROGRESS.md
git diff --staged
git commit -m "Add Git practice automation and documentation"

# Configure GitHub remote if supplied
if [[ -n "$REMOTE_URL" ]]; then
    git remote add origin "$REMOTE_URL"
    git remote -v
    git push -u origin main
else
    echo ""
    echo "No GitHub remote supplied."
    echo "Connect your repository using:"
    echo "git remote add origin YOUR_GITHUB_REPOSITORY_URL"
    echo "git push -u origin main"
fi

echo ""
echo "Git practice setup completed successfully!"
echo ""
echo "Final repository status:"
git status

echo ""
echo "Commit history:"
git log --oneline --graph --all
igin https://github.com/YOUR-USERNAME/YOUR-REPOSITORY.git
git remote -v
git push -u origin main

