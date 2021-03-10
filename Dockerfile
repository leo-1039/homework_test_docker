FROM jupyter/datascience-notebook

#open port
EXPOSE 8888
EXPOSE 5000

#copy file to workspace
ADD files.tar /home/jovyan/work/

#install mlflow
RUN pip install mlflow

#start jupyter notebook and mlflow server
CMD tini -g -- start-notebook.sh & tini -g -- mlflow server --host 0.0.0.0 --backend-store-uri /home/jovyan/work/mlruns/

