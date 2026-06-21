# Class Game Studio — 작업 메모

> ⚠️ **이 폴더는 구버전 코드베이스입니다.** 새 작업은 가능한 한 `Projects/실시간 게임/`(신버전) 사용.
> 다만 사용자가 이 폴더에 배포된 Firebase Hosting URL을 실제 수업에 쓰고 있다면, 여기서 직접 수정·재배포하는 것이 최단 경로입니다.

---

## 1. 이 폴더의 정체

**Firebase Hosting에 배포되는 단일 정적 HTML 사이트**입니다.
- Firebase 프로젝트: `bing-go-game`
- React·Vite·번들러 없음 — 모든 JS는 HTML 안에 인라인
- 게임 3종이 한 사이트에 통합

## 2. 게임 파일

| 파일 | 게임 | 비고 |
|------|------|------|
| `index.html` | 게임 선택 메뉴 (랜딩) | 4.7KB |
| `bingo_game.html` | 빙고 게임 | 34KB, 가장 큰 파일 |
| `quiz_game.html` | 퀴즈 게임 | 48KB |
| `description_game.html` | 설명 게임 (그림 보고 맞히기) | 33KB |
| `firebase_config.js` | Firebase 초기화 설정 (공통) | 3개 게임 공유 |

## 3. 배포 절차 (요약)

자세한 단계별 안내는 같은 폴더의 **`배포_가이드.md`** 참고. 비개발자용으로 0~10단계까지 풀어 써 있습니다.

핵심 흐름:
```
1. (최초 1회) Node.js + Firebase CLI 설치
2. 로컬 파일 수정 (HTML 또는 firebase_config.js)
3. cmd에서 이 폴더로 cd
4. firebase login (최초 1회)
5. firebase deploy 또는 배포하기.bat 더블클릭
6. Firebase Hosting URL에서 확인
```

## 4. 작업 시 주의사항

### 4.1 인코딩
- 모든 HTML은 UTF-8 (BOM 없이)
- 한글 깨짐 발생 시 이 부분 먼저 확인

### 4.2 Firebase 설정 변경
- `firebase_config.js`는 **3개 게임이 공유**하므로 변경 시 전체 영향
- DB 구조·규칙 변경 시 기존 세션 데이터와 충돌 가능 → Firebase 콘솔에서 노드 삭제 후 재시작

### 4.3 캐싱
- Firebase Hosting은 정적 파일을 강하게 캐싱 → 배포 후 변경이 안 보이면 브라우저 강력 새로고침 (Ctrl+F5)
- 필요 시 `firebase.json`의 `cacheControl` 헤더 조정

### 4.4 구·신버전 동기화 금지
- 이 폴더의 `bingo_game.html`과 `Projects/실시간 게임/빙고게임/`은 **별개의 코드베이스**
- 한쪽 수정이 자동으로 다른 쪽에 반영되지 않음
- 사용자에게 어느 사이트를 쓰는지 물어본 후 **한쪽만** 수정

## 5. 신버전으로 이전하려면

언젠가 이 구버전을 폐기하고 싶을 때:
1. 사용 중인 게임을 신버전 폴더로 이식 (이미 빙고게임은 이전됨)
2. Firebase Hosting URL을 신버전 Vercel URL로 리다이렉트
3. 이 폴더는 `_archive/`로 이동 (또는 폴더명 앞에 `_archive_` 접두어)

## 6. 관련 문서

- `배포_가이드.md` — 비개발자용 단계별 배포 안내 (0~10단계)
- `../CLAUDE.md` (`실시간 게임/CLAUDE.md`) — 구·신버전 비교
- `../../Projects/실시간 게임/CLAUDE.md` — 신버전 폴더 인덱스
