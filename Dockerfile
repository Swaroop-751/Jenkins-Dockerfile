FROM python:3.8.0-slim  
WORKDIR /python-docker
COPY . .
RUN pip3 install flask
RUN pip3 install scikit-learn
RUN pip3 install nltk
EXPOSE 5000
EXPOSE 80 
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
