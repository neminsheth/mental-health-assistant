# ML part for IPD project

To used the model, run the command git clone -b master (https://github.com/neminsheth/ipd). This will clone only this branch of the repo.

# Dataset

The data set used for training the data is [data.csv](dataset/data.csv).
Other datasets in the dataset folder were used initially and the [data.csv](dataset/data.csv) is made in reference to those datasets.

# Model

The model used to detecting the mental health score is [final.pkl](models\final.pkl)
All the other models in the models directory were used earlier and was replaced by this single file.

The training notebook is [training.ipynb](training.ipynb), contains all the pre-processing and training and testing code.

# Server

The model is run through the [flask_server.py](flask_server.py), make sure to change the loaded model's path before running. 

The server for integrating model with mobile app is run through ngrok, located in gitignore for this branch.
For details checkout their official documentation. [ngrok](https://ngrok.com/docs)

# Privacy 
© 2024. All rights reserved. 
(Code available to use for non-commercial purposes ONLY.)

