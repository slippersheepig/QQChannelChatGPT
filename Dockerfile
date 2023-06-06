FROM python:alpine
RUN apk add --no-cache git
RUN git clone https://github.com/Soulter/QQChannelChatGPT.git /qc-chatbot
WORKDIR /qc-chatbot
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN apk del git

CMD [ "python", "main.py" ]
