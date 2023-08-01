import mysql.connector
from tkinter import *

connection = mysql.connector.connect(
    host = "4.tcp.ngrok.io",
    port = 16581,
    user = "project_python",
    password = "password",
    database = "cs425_healthcare_mgmt_sys"
)
cursor = connection.cursor()

def display_results(columns, data):
    for i in range(len(columns)):
        entry = Entry(window, width = 20, fg = "black", font = ("Arial", 12))
        entry.grid(row = 0, column = i)
        entry.insert(END, columns[i])
    
    for i in range(len(data)):
        for j in range(len(data[0])):
            entry = Entry(window, width = 20, fg = "black", font = ("Arial", 12))
            entry.grid(row = i+1, column = j)
            entry.insert(END, data[i][j])

def execute_query(query):
    arr = []
    cursor.execute(query)
    for item in cursor:
        arr.append(item)
    display_results(cursor.column_names, arr)


#print(cursor.__dir__())
#print(cursor.column_names)

window = Tk()

qr = "select * from doctor limit 5"
execute_query(qr)

window.mainloop()
cursor.close()
connection.close()