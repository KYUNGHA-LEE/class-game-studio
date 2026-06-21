@echo off
chcp 65001 >nul
setlocal

cd /d "%~dp0"

echo.
echo ============================================================
echo   🎯 빙고 게임 자동 배포 스크립트
echo ============================================================
echo.

REM 1. Node.js 확인
where node >nul 2>nul
if %errorlevel% neq 0 (
  echo ❌ Node.js가 설치되어 있지 않습니다.
  echo.
  echo 👉 https://nodejs.org 에서 LTS 버전을 다운받아 설치한 뒤
  echo    이 창을 닫고 이 .bat 파일을 다시 실행하세요.
  echo.
  pause
  exit /b 1
)

echo ✅ Node.js 확인됨
node -v
echo.

REM 2. Firebase CLI 확인 (없으면 설치)
where firebase >nul 2>nul
if %errorlevel% neq 0 (
  echo 📦 Firebase CLI가 없습니다. 자동 설치 시작...
  call npm install -g firebase-tools
  if %errorlevel% neq 0 (
    echo ❌ Firebase CLI 설치 실패. 명령 프롬프트를 관리자 권한으로 다시 열고 시도해 주세요.
    pause
    exit /b 1
  )
  echo ✅ Firebase CLI 설치 완료
) else (
  echo ✅ Firebase CLI 확인됨
  call firebase --version
)
echo.

REM 3. firebase_config.js 검증
findstr /C:"여기에_API_KEY_붙여넣기" firebase_config.js >nul
if %errorlevel% equ 0 (
  echo ⚠️  firebase_config.js에 아직 본인 Firebase 키가 들어있지 않습니다.
  echo.
  echo 👉 다음 페이지에서 설정값을 복사하세요:
  echo    https://console.firebase.google.com/project/bing-go-game/settings/general
  echo    → 내 앱 → SDK 설정 및 구성 → 구성(Config) 옵션 선택
  echo.
  echo 그리고 메모장으로 firebase_config.js 를 열어
  echo    apiKey, messagingSenderId, appId 세 곳을 본인 값으로 바꿔주세요.
  echo.
  echo 수정 끝나면 이 .bat 파일을 다시 실행하세요.
  echo.
  pause
  exit /b 1
)

echo ✅ firebase_config.js 키 입력됨
echo.

REM 4. 로그인 상태 확인
firebase projects:list >nul 2>nul
if %errorlevel% neq 0 (
  echo 🔑 Firebase 로그인이 필요합니다. 브라우저가 열립니다...
  call firebase login
  if %errorlevel% neq 0 (
    echo ❌ 로그인 실패
    pause
    exit /b 1
  )
)

echo ✅ Firebase 로그인됨
echo.

REM 5. 배포!
echo 🚀 배포 시작...
echo.
call firebase deploy --only hosting,database,storage

if %errorlevel% neq 0 (
  echo.
  echo ❌ 배포 실패. 위 에러 메시지를 확인하세요.
  pause
  exit /b 1
)

echo.
echo ============================================================
echo   ✅ 배포 완료!
echo ============================================================
echo.
echo 🎯 학생 공유 링크: https://bing-go-game.web.app
echo.
echo 이 링크를 학생들에게 공유하세요.
echo 선생님은 같은 링크에서 "선생님으로 입장" 버튼을 누르면 됩니다.
echo.
pause
