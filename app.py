from vanna.chromadb import ChromaDB_VectorStore
from vanna.flask import VannaFlaskApp
from vanna.openai import OpenAI_Chat

class MyVanna(ChromaDB_VectorStore, OpenAI_Chat):
    def __init__(self, config=None):
        ChromaDB_VectorStore.__init__(self, config=config)
        OpenAI_Chat.__init__(self, config=config)

vn = MyVanna(config={'api_key': '', 'model': 'gpt-4'})


vn.connect_to_mysql(host='127.0.0.1', dbname='', user='', password='', port=3306)

app = VannaFlaskApp(vn)
app.run()