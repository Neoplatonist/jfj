FROM golang:alpine 
# as builder

RUN apk --no-cache add curl git 
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

WORKDIR /go/src/app
COPY . .
RUN dep ensure; go build -o main
CMD ./main


# FROM alpine:latest
# COPY --from=builder /go/src/app/client .
# COPY --from=builder /go/src/app/main .
# CMD ./main