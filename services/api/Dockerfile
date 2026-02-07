FROM python:3.12-slim

# 1) Crear usuario no-root (mejor práctica de seguridad)
RUN useradd -m -u 10001 appuser

WORKDIR /app

# 2) Instalar dependencias (cache-friendly)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 3) Copiar código y ajustar permisos
COPY app ./app
RUN chown -R appuser:appuser /app

USER appuser

EXPOSE 8000
CMD ["uvicorn", "app.main:app", "--host=0.0.0.0", "--port=8000"]
