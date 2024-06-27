FROM alpine:3.19
RUN apk update && apk upgrade

# install python 3.12 and its package manager pip
RUN apk --no-cache add python3 py3-pip

# install django and dependencies
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt --break-system-packages

WORKDIR /django
COPY django /django

EXPOSE 8000

# run server at http://0.0.0.0:8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
