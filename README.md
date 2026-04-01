# D-ONWORKS Claude Code 공통 규칙

전 프로젝트, 전 직원에게 강제 적용되는 Claude Code 규칙입니다.

## 최초 설치 (직원 PC에서 1회만)

PowerShell을 **관리자 권한**으로 열고:
```powershell
git clone https://github.com/d-onworks/claude-rules.git C:\src\claude-rules
powershell -ExecutionPolicy Bypass -File C:\src\claude-rules\deploy.ps1
```

끝. Claude Code 재시작하면 적용됩니다.

## 규칙 업데이트 시

관리자가 이 레포에서 `CLAUDE.md` 수정 후 push하면, 각 직원 PC에서:
```powershell
powershell -ExecutionPolicy Bypass -File C:\src\claude-rules\deploy.ps1
```
> deploy.ps1이 자동으로 git pull + 파일 배포를 합니다.

## 구조

| 파일 | 용도 |
|------|------|
| `CLAUDE.md` | 회사 공통 규칙 (AI 품질, 코드 구조, 보안, 프로세스) |
| `managed-settings.json` | 위험 명령 차단 (rm -rf, force push, env 읽기 등) |
| `deploy.ps1` | 클론 + 배포 자동화 스크립트 |

## 적용 원리

`C:\Program Files\ClaudeCode\`에 배포된 파일은 **Managed Settings**로 작동합니다:
- 모든 사용자, 모든 프로젝트에 강제 적용
- 개인이 override 불가
- Claude Code 시작 시 자동 로드
