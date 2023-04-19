FROM python:alpine
RUN apk add --no-cache git
RUN git clone -b 02b5d4911f6d90e1a26d6c58b94da1b610567c6c https://github.com/Soulter/QQChannelChatGPT.git /qc-chatbot
WORKDIR /qc-chatbot
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

CMD [ "python", "main.py" ]
