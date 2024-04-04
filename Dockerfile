FROM debian
WORKDIR /app_root

RUN apt update -y &&\
    apt install -y tesseract-ocr tesseract-ocr-jpn libtesseract-dev libleptonica-dev tesseract-ocr-script-jpan tesseract-ocr-script-jpan-vert
RUN apt install -y unzip
