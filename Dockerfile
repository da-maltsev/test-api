ARG PYTHON_VERSION
FROM python:${PYTHON_VERSION}-slim-bookworm

ADD requirements.txt /

RUN pip install --no-cache-dir -r /requirements.txt

WORKDIR /src

ADD *.py .

USER nobody

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"] 