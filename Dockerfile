FROM python:alpine
RUN apk add --no-cache git
RUN git clone -b v3.0.1 https://github.com/Soulter/QQChannelChatGPT.git /qc-chatbot
WORKDIR /qc-chatbot
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

CMD [ "python", "main.py" ]
