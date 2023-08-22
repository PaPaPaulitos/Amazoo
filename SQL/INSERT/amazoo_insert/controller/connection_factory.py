import mysql.connector

conexao = mysql.connector.connect(
   host='localhost',
   user='root',
   password='12345',
   database='amazoo'
)


cursor = conexao.cursor()