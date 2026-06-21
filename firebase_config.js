// ============================================================
// Firebase 설정 파일
// ============================================================
// 프로젝트: bing-go-game (싱가포르)
// Realtime Database / Storage 모두 활성화 완료
// ============================================================

export const firebaseConfig = {
  apiKey: "AIzaSyCYAJZNE8pqD0IP6Do8pDD7CoWxOqAfbT4",
  authDomain: "bing-go-game.firebaseapp.com",
  databaseURL: "https://bing-go-game-default-rtdb.asia-southeast1.firebasedatabase.app",
  projectId: "bing-go-game",
  storageBucket: "bing-go-game.firebasestorage.app",
  messagingSenderId: "251312946168",
  appId: "1:251312946168:web:0cf22019c7ac250431740d",
  measurementId: "G-0DQB3PHSYG"
};

// 같은 URL을 여러 반에서 동시에 쓰고 싶다면 ?room=1반 처럼 붙여서 공유하세요.
// 예: https://bing-go-game.web.app/?room=2학년3반
