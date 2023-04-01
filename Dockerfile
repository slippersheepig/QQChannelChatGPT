FROM alpine AS builder
RUN apk add --no-cache git
RUN git clone https://github.com/Soulter/QQChannelChatGPT.git /qc-chatbot

FROM python:alpine
WORKDIR /qc-chatbot
COPY --from=builder /qc-chatbot/addons/ /qc-chatbot/configs/ /qc-chatbot/cores/ /qc-chatbot/util/ /qc-chatbot/chatgpt_key_record /qc-chatbot/main.py .
COPY requirements.txt /qc-chatbot
RUN pip install --no-cache-dir -r requirements.txt

CMD [ "python", "main.py" ]
