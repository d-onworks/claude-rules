# D-ONWORKS Claude Code 공통 규칙

전 프로젝트에 자동 적용되는 Claude Code 규칙입니다.

## 적용 방법

### 방법 1: Managed Settings (관리자 — 강제 적용)

Windows에서 관리자 권한으로 실행:
```powershell
# 1. 디렉토리 생성
New-Item -ItemType Directory -Path "C:\Program Files\ClaudeCode" -Force

# 2. CLAUDE.md 복사 (이후 업데이트 시에도 이 명령 재실행)
Copy-Item "C:\src\claude-rules\CLAUDE.md" "C:\Program Files\ClaudeCode\CLAUDE.md" -Force

# 3. Managed Settings 복사
Copy-Item "C:\src\claude-rules\managed-settings.json" "C:\Program Files\ClaudeCode\managed-settings.json" -Force
```

> Managed Settings는 개인이 override 불가. 모든 사용자, 모든 프로젝트에 강제 적용됩니다.

### 방법 2: Symlink (개발자 — 프로젝트별 적용)

각 프로젝트에서:
```bash
# 프로젝트의 .claude/rules/ 안에 심볼릭 링크 생성
cd 프로젝트루트/.claude/rules/
mklink company-rules.md C:\src\claude-rules\CLAUDE.md
```

### 규칙 업데이트

1. 이 레포에서 `CLAUDE.md` 수정 후 커밋/푸시
2. 각 PC에서 `git pull`
3. Managed Settings 사용 시: `deploy.ps1` 재실행
