# syntax=docker/dockerfile:1.7

FROM python:3.12-slim AS builder
WORKDIR /build

COPY requirements.txt .

RUN --mount=type=cache,target=/root/.cache/pip \
    pip install --prefix=/install --no-cache-dir -r requirements.txt


FROM python:3.12-slim AS runtime
WORKDIR /app

RUN useradd -m -u 10001 appuser

COPY --from=builder /install /usr/local
COPY app ./app

RUN chown -R appuser:appuser /app
USER appuser

EXPOSE 8000
CMD ["uvicorn", "app.main:app", "--host=0.0.0.0", "--port=8000"]
