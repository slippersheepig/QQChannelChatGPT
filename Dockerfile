FROM python:alpine
RUN apk add --no-cache git
WORKDIR /qc-chatbot
RUN git clone https://github.com/Soulter/QQChannelChatGPT.git /qc-chatbot
COPY requirements.txt /qc-chatbot
RUN pip install --no-cache-dir -r requirements.txt

CMD [ "python", "main.py" ]
