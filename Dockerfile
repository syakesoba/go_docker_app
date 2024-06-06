# ベースイメージとして公式のGolangイメージを使用
FROM golang:1.22.4-alpine

WORKDIR /app

# 最初は以下の部分はコメントアウトする
 COPY backend/go.mod .
 COPY backend/go.sum .

 RUN go mod download
 RUN apk add --no-cache gcc
 RUN apk add --no-cache musl-dev

 COPY ./backend .

 CMD ["go", "run", "./cmd/hello"]