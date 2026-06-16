# fastapi-docker-healthcheck

FastAPI 프로젝트를 Docker로 실행해보기 위한 간단한 테스트 프로젝트입니다.

`/health` API를 통해 컨테이너에서 FastAPI 서버가 정상 실행되는지 확인합니다.

---

## 기술 스택

* Python
* FastAPI
* Uvicorn
* Docker

---

## 프로젝트 구조

```text
fastapi-docker-healthcheck/
├── app/
│   └── main.py
├── requirements.txt
├── Dockerfile
├── .dockerignore
└── README.md
```

---

## 로컬 실행

```bash
uvicorn app.main:app --reload
```

접속 확인:

```text
http://localhost:8000/health
```

---

## Docker 이미지 빌드

```bash
docker build -t fastapi-docker-healthcheck .
```

---

## Docker 컨테이너 실행

```bash
docker run --name fastapi-healthcheck-container -p 8000:8000 fastapi-docker-healthcheck
```

접속 확인:

```text
http://localhost:8000/health
```

---

## API 응답 예시

```json
{
  "status": "ok",
  "service": "fastapi-docker-healthcheck"
}
```

---

## 컨테이너 중지 및 삭제

```bash
docker stop fastapi-healthcheck-container
docker rm fastapi-healthcheck-container
```

---

## 학습 내용

* Dockerfile 작성
* FastAPI 프로젝트 Docker 이미지 빌드
* Docker 컨테이너 실행
* `-p 8000:8000` 포트 매핑 이해
* `/health` API를 통한 서버 상태 확인
