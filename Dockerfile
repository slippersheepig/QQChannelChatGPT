FROM python:alpine
RUN apk add --no-cache git
RUN git clone https://github.com/Soulter/QQChannelChatGPT.git /qc-chatbot
WORKDIR /qc-chatbot
COPY provider_rev_edgegpt.py ./model/provider
COPY main.py requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

CMD [ "python", "main.py" ]
