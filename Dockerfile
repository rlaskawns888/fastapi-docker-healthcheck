#1.빌드 
FROM python:3.11-slim AS builder

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir --user -r requirements.txt

#2. 실행
FROM python:3.11-slim

WORKDIR /app

#non-root 유저 생성
RUN useradd -create-home appuser

#빌드 단계에서 설치한 패키지만 복사 (빌드 도구는 안 가져옴)
COPY --from=builder /root/.local /home/appuser/.local

COPY app ./app

ENV PATH=/home/appuser/.local/bin:$PATH

#non-root 유저로 전환
USER appuser

EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]