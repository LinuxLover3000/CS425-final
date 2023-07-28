import mysql.connector
connection = mysql.connector.connect(
    host = "6.tcp.ngrok.io",
    port = 18920,
    user = "project_python",
    password = "password",
    database = "cs425_healthcare_mgmt_sys"
)
cursor = connection.cursor()
query = "select * from doctor"
cursor.execute(query)
for item in cursor:
    print(item)
cursor.close()
connection.close()