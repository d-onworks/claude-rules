# D-ONWORKS Claude Code 규칙 배포 스크립트
# 관리자 권한으로 실행 필요

$ErrorActionPreference = "Stop"
$source = Split-Path -Parent $MyInvocation.MyCommand.Path
$target = "C:\Program Files\ClaudeCode"

Write-Host "D-ONWORKS Claude Rules 배포" -ForegroundColor Cyan
Write-Host "소스: $source" -ForegroundColor Gray
Write-Host "대상: $target" -ForegroundColor Gray

# 디렉토리 생성
if (!(Test-Path $target)) {
    New-Item -ItemType Directory -Path $target -Force | Out-Null
    Write-Host "[OK] 디렉토리 생성: $target" -ForegroundColor Green
}

# CLAUDE.md 복사
Copy-Item "$source\CLAUDE.md" "$target\CLAUDE.md" -Force
Write-Host "[OK] CLAUDE.md 배포 완료" -ForegroundColor Green

# managed-settings.json 복사
Copy-Item "$source\managed-settings.json" "$target\managed-settings.json" -Force
Write-Host "[OK] managed-settings.json 배포 완료" -ForegroundColor Green

Write-Host ""
Write-Host "배포 완료. Claude Code 재시작 시 적용됩니다." -ForegroundColor Cyan
