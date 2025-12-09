# deploy.ps1 - helper for creating repo and pushing to GitHub with GitHub CLI
param(
    [string]$username = "starrybamboo",
    [string]$repo = "tuanchat-render-demo",
    [switch]$public
)

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Host "GitHub CLI (gh) not found. Please install it from https://cli.github.com/ and login using 'gh auth login'" -ForegroundColor Yellow
    exit 1
}

if (-not (Test-Path ".git")) {
    git init
    git add --all
    git commit -m "Initial commit: prepare for GitHub Pages"
}

$visibility = if ($public) { "--public" } else { "--private" }

gh repo create "$username/$repo" $visibility --source=. --remote=origin --push
Write-Host "Created and pushed to https://github.com/$username/$repo" -ForegroundColor Green
