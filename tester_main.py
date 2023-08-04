
from tkinter.ttk import *
from tkinter import *
import mysql.connector
scrollWind = Tk()
scrollWind.geometry( "200x200" )

connection = mysql.connector.connect(
    host = "4.tcp.ngrok.io",
    port = 16581,
    user = "project_python",
    password = "password",
    database = "cs425_healthcare_mgmt_sys"
)
cursor = connection.cursor()
#transferred
def display_results(columns, data):
   # clear_results()

    # Create a Treeview widget to display results
    tree = Treeview(results, columns=columns, show='headings')
    scrollbar = Scrollbar(results, orient=VERTICAL, command=tree.yview)
    tree.configure(yscroll=scrollbar.set)
    tree.grid(row=0, column=0)
    scrollbar.grid(row=0, column=1, sticky="ns")

    #scrollbar.pack()
    #tree.pack()

    for col in columns:
        tree.heading(col, text=col)
        tree.column(col, width=100)  

    # Insert data into the treeview
    for row in data:
        tree.insert("", END, values=row)

#def clear_results():
 #   for widget in results.winfo_children():
  #      widget.destroy()

#excecute command
def execute_query(query):
    arr = []
    try:
        cursor.execute(query)
    except mysql.connector.Error as e:
        print("MySQL error: {}".format(e))
    for item in cursor:
        arr.append(item)
    display_results(cursor.column_names, arr)

def patient_mode():
    execute_query(patient_queries)

#transferred end

#show options on the scroll
def show():
    scrollText(clicked.get())
   
options=[
    "Doctor Contact info",
    "Nurse Contact info"
    ]

#cases
def scrollText(argument):
    match argument:
        case "Doctor Contact info":
            return label.config(text="table1")
            return patient_mode
        case  "Nurse Contact info":
            return label.config(text="table2")
#cases end 

# datatype of menu text
clicked = StringVar()
clicked.set( "Select Contact Info" )

# Create Dropdown menu
drop = OptionMenu( scrollWind , clicked , *options )
drop.pack()

# Create button, it will change label text
scroll_button = Button( scrollWind , text = "Enter" , command = show).pack()

# Create Label
label = Label( scrollWind , text = " " )
label.pack()



#queries
patient_queries = [
    ("select doctor.type as department, CONCAT(doctor.name_first, ' ', doctor.name_last) AS name, employee_phone.phone from doctor inner join employee_phone on doctor.EID=employee_phone.EID order by type", "Doctor Contact info"),
    ("select nurse.type as department, CONCAT(nurse.name_first, ' ', nurse.name_last) AS name, employee_phone.phone from nurse inner join employee_phone on nurse.EID=employee_phone.EID order by type", "Nurse Contact info"),
]

results = Frame(scrollWind)
# Execute tkinter
scrollWind.mainloop()
cursor.close()
connection.close()
#scroll end