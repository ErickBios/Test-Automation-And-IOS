from robot.api.deco import keyword
from pymongo import MongoClient

client = MongoClient ('mongodb+srv://aqx:xperience@cluster0.352gf.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0')

db = client['test']

@keyword('Remove task from database')
def remove_task_by_name(task_name):
    collection = db['tasks']
    collection.delete_many({'text': task_name})
    print('Removendo a tarefa'+ task_name)