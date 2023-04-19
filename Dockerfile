FROM python:alpine
RUN apk add --no-cache git
RUN git clone https://github.com/Soulter/QQChannelChatGPT.git /qc-chatbot
RUN git reset --hard a104d9df5e62b0e395e370e242931a245cd1fe0e
WORKDIR /qc-chatbot
COPY provider_rev_edgegpt.py ./model/provider
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

CMD [ "python", "main.py" ]
