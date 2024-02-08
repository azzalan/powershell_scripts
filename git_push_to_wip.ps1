# Check if the wip branch exists locally
$localExists = git branch --list wip

# Check if the wip branch exists on the remote
$remoteExists = git ls-remote --heads origin wip

if ($localExists -or $remoteExists) {
    Write-Host "The 'wip' branch already exists either locally or on the remote. Exiting..."
} else {
    git checkout -b wip;
    git stage --all;
    git commit -m "wip";
    git push -u origin wip
}