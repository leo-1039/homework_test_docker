FROM jupyter/datascience-notebook

#open port
EXPOSE 8888
EXPOSE 5000

#copy file to workspace
ADD files.tar /home/jovyan/

#install mlflow
RUN pip install mlflow

#start jupyter notebook and mlflow server
#關於讓mlflow註冊模型，方法參照 https://stackoverflow.com/questions/63255631/mlflow-invalid-parameter-value-unsupported-uri-mlruns-for-model-registry-s
#需要用 db 作為 backend-store-uri
#另外 python 程式碼裡面要加 mlflow.set_tracking_uri("http://localhost:5000")
CMD tini -g -- start-notebook.sh & tini -g -- mlflow server --backend-store-uri sqlite:///mlflow.db --default-artifact-root /home/jovyan/work/artifacts --host 0.0.0.0

