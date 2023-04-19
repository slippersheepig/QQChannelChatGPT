FROM python:alpine
RUN apk add --no-cache git
RUN git clone https://github.com/Soulter/QQChannelChatGPT.git /qc-chatbot
RUN git reset --hard a104d9d
WORKDIR /qc-chatbot
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

CMD [ "python", "main.py" ]
