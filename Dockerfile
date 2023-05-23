FROM tiangolo/uvicorn-gunicorn-fastapi:python3.7

COPY ./main.py /app/main.py
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
