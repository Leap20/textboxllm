FROM python:3.11-slim

WORKDIR /app
COPY requirements.txt requirements.txt

RUN apt-get update && apt-get install -y git

RUN pip3 install -r requirements.txt

COPY . .
RUN pip install -e ./packages/dtsense-rag

CMD  uvicorn app.server:app --host 0.0.0.0 --port 8000

#docker build -f Dockerfile -t dtsense-rag . # untuk MAC tambahkan --platform linux/amd64, jika mau deploy di cloud
#docker run -p 8080:8000 -d dtsense-rag