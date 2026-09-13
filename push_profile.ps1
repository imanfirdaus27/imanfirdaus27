# push_profile.ps1  —  publishes your GitHub PROFILE README
#
# A repo named exactly after your username is special: its README.md is what
# people see when they open github.com/imanfirdaus27
#
# Run from this folder in PowerShell:
#       cd "C:\Users\firda\Desktop\Master\github-profile"
#       .\push_profile.ps1
#
# NOTE: the repo already had an old README from 2023. This script merges the
# remote history in but keeps THIS folder's README as the winner (-X ours),
# so the old commits stay in the log and the new page is what shows.

param([string]$RepoUrl = "https://github.com/imanfirdaus27/imanfirdaus27.git")

$ErrorActionPreference = "Stop"
Set-Location -Path $PSScriptRoot

if (-not (Test-Path ".git")) { git init | Out-Null }
if (Test-Path ".git\index.lock") { Remove-Item ".git\index.lock" -Force }

git config user.name  "Muhammad Iman Firdaus Bin Md Rostan"
git config user.email "firdausrostan@gmail.com"

if (-not (git remote | Select-String -Quiet "origin")) {
    git remote add origin $RepoUrl
} else {
    git remote set-url origin $RepoUrl
}

# If a previous run left a conflicted merge behind, clear it first.
if (Test-Path ".git\MERGE_HEAD") {
    Write-Host "Clearing an unfinished merge from a previous run..." -ForegroundColor Yellow
    git merge --abort
}

git add -A
$pending = git status --porcelain
if (-not [string]::IsNullOrWhiteSpace($pending)) {
    git commit -m "Update profile README"
}

git branch -M main
git fetch origin
$remoteMain = git ls-remote --heads origin main
if (-not [string]::IsNullOrWhiteSpace($remoteMain)) {
    Write-Host "Merging the existing repo history (keeping this folder's README)..." -ForegroundColor Cyan
    git pull origin main --allow-unrelated-histories --no-rebase --no-edit -X ours
}

git push -u origin main
Write-Host "`nDone. Open https://github.com/imanfirdaus27" -ForegroundColor Green
