# Check if the current branch is 'wip'
$currentBranch = git rev-parse --abbrev-ref HEAD
if ($currentBranch -ne 'wip') {
    Write-Host "Warning: You are not on the 'wip' branch. Current branch is '$currentBranch'."
    exit
}

# Reset 'wip' branch to match 'develop' with a soft reset
# Find the commit hash for the tip of 'develop'
$developCommit = git rev-parse develop
git reset --soft $developCommit

# Checkout 'develop' branch
git checkout develop

# Delete wip branch locally and remotelly
git branch -d wip;
git push origin -d wip

Write-Host "Wip has been consolidated." -f Green