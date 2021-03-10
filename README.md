# homework_test_docker
題目
*. assignment #1 (docker)
1. 以data science JupyterBook的image為base image
2. 在base image上面加上python MLflow
3. 啟動此image後，連進jupyter notebook，執行iris dataset的classification
4. 使用MLFLOW做model registry跟 在notebook裡透過mlflow API開啟已經放在registry的model 做分類
----
1. 開啟終端機 cd 到 Dockerfile 所在資料夾
cd [your path]
docker build -t="mlflow_with_jupyter" .
(看到Successfully tagged mlflow_with_jupyter:latest表示build完成)
2. 啟動
docker run --name mlflow_with_jupyter_container -p 8888:8888 -p 5000:5000 mlflow_with_jupyter
然後它會有訊息如下：
    To access the notebook, open this file in a browser:
		file:///home/jovyan/.local/share/jupyter/runtime/nbserver-9-open.html
		Or copy and paste one of these URLs:
		http://642a7cb5b41b:8888/?token=fe4ff329021808fc763b3dc1467587f1576deb21c0788611
		or http://127.0.0.1:8888/?token=fe4ff329021808fc763b3dc1467587f1576deb21c0788611
瀏覽器開啟它給的連結例如 http://127.0.0.1:8888/?token=fe4ff329021808fc763b3dc1467587f1576deb21c0788611
就可以看到 jupyter notebook 了
瀏覽器開啟
http://0.0.0.0:5000 
就可以看到 mlflow server 了
第二輪以後，由於容器還在，直接 docker start mlflow_with_jupyter_container -i 就可以執行

3. 訓練/預測
在 jupyter notebook 進入 work 資料夾， iris_train.ipynb 是訓練用的， classify_iris_by_mlflow.ipynb 是預測用的



