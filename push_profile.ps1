# push_profile.ps1  —  publishes your GitHub PROFILE README
#
# A repo named exactly after your username is special: its README.md is what
# people see when they open github.com/imanfirdaus27
#
# 1. Create a repo on github.com named EXACTLY:  imanfirdaus27
#    Public. Tick "Add a README file" if you like — this script overwrites it.
# 2. Run this from this folder in PowerShell:
#       cd "C:\Users\firda\Desktop\Master\github-profile"
#       .\push_profile.ps1

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

git add -A
$pending = git status --porcelain
if (-not [string]::IsNullOrWhiteSpace($pending)) {
    git commit -m "Update profile README"
}

git branch -M main
git fetch origin
$remoteMain = git ls-remote --heads origin main
if (-not [string]::IsNullOrWhiteSpace($remoteMain)) {
    git pull origin main --allow-unrelated-histories --no-rebase --no-edit
}

git push -u origin main
Write-Host "`nDone. Open https://github.com/imanfirdaus27" -ForegroundColor Green
