# D-ONWORKS Claude Code 규칙 배포 스크립트
# 관리자 권한으로 실행 필요
# 사용법: PowerShell 관리자 모드에서 실행
#   powershell -ExecutionPolicy Bypass -File C:\src\claude-rules\deploy.ps1

$ErrorActionPreference = "Stop"
$repoUrl = "https://github.com/d-onworks/claude-rules.git"
$clonePath = "C:\src\claude-rules"
$target = "C:\Program Files\ClaudeCode"

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  D-ONWORKS Claude Rules 설치/업데이트" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Step 1: 레포 클론 또는 풀
if (Test-Path "$clonePath\.git") {
    Write-Host "[1/3] 기존 레포 업데이트 중..." -ForegroundColor Yellow
    Push-Location $clonePath
    git pull --quiet 2>$null
    Pop-Location
    Write-Host "[OK] git pull 완료" -ForegroundColor Green
} else {
    Write-Host "[1/3] 레포 클론 중..." -ForegroundColor Yellow
    if (!(Test-Path "C:\src")) {
        New-Item -ItemType Directory -Path "C:\src" -Force | Out-Null
    }
    git clone $repoUrl $clonePath 2>$null
    Write-Host "[OK] git clone 완료: $clonePath" -ForegroundColor Green
}

# Step 2: Managed Settings 디렉토리 생성
if (!(Test-Path $target)) {
    New-Item -ItemType Directory -Path $target -Force | Out-Null
    Write-Host "[2/3] 디렉토리 생성: $target" -ForegroundColor Green
} else {
    Write-Host "[2/3] 디렉토리 확인: $target" -ForegroundColor Green
}

# Step 3: 파일 배포
Copy-Item "$clonePath\CLAUDE.md" "$target\CLAUDE.md" -Force
Copy-Item "$clonePath\managed-settings.json" "$target\managed-settings.json" -Force
Write-Host "[3/3] CLAUDE.md + managed-settings.json 배포 완료" -ForegroundColor Green

Write-Host ""
Write-Host "설치 완료!" -ForegroundColor Cyan
Write-Host "- 규칙 위치: $target\CLAUDE.md" -ForegroundColor Gray
Write-Host "- 설정 위치: $target\managed-settings.json" -ForegroundColor Gray
Write-Host "- Claude Code 재시작 시 자동 적용됩니다." -ForegroundColor Gray
Write-Host "- 이 규칙은 개인이 override 할 수 없습니다." -ForegroundColor Red
Write-Host ""
