FROM alpine AS builder
RUN apk add --no-cache git
RUN git clone https://github.com/Soulter/QQChannelChatGPT.git /qc-chatbot

FROM python:alpine
WORKDIR /qc-chatbot
COPY --from=builder /qc-chatbot/configs ./configs
COPY --from=builder /qc-chatbot/cores ./cores
COPY --from=builder /qc-chatbot/model ./model
COPY --from=builder /qc-chatbot/util ./util
COPY --from=builder /qc-chatbot/chatgpt_key_record .
COPY --from=builder /qc-chatbot/launcher.py .
COPY --from=builder /qc-chatbot/main.py .
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

CMD [ "python", "main.py" ]
