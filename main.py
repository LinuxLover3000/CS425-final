import mysql.connector
from tkinter import *
import tkinter as tk
from tkinter import ttk, messagebox, scrolledtext


connection = mysql.connector.connect(
    host = "4.tcp.ngrok.io",
    port = 16581,
    user = "project_python",
    password = "password",
    database = "cs425_healthcare_mgmt_sys"
)
cursor = connection.cursor()

def display_results(columns, data):
    clear_results()

    # Create a Treeview widget to display results
    tree = ttk.Treeview(results, columns=columns, show='headings')
    tree.pack()

    
    for col in columns:
        tree.heading(col, text=col)
        tree.column(col, width=100)  

    # Insert data into the treeview
    for row in data:
        tree.insert("", tk.END, values=row)

def clear_results():
    for widget in results.winfo_children():
        widget.destroy()

def clear_results():
    for widget in results.winfo_children():
        widget.destroy()

def execute_query(query):
    arr = []
    try:
        cursor.execute(query)
    except:
        print("sql error")
    for item in cursor:
        arr.append(item)
    display_results(cursor.column_names, arr)


def admin_mode():
    clear_options()
    show_buttons(admin_queries)

def employee_mode():
    clear_options()
    show_buttons(employee_queries)

def patient_mode():
    clear_options()
    show_buttons(patient_queries)

def clear_options():
    for widget in options_frame.winfo_children():
        widget.destroy()

def show_buttons(button_list):
    
    r = 0
    c = 0
    for button_data in button_list:
        button = tk.Button(options_frame, text=button_data[1], command=lambda qr=button_data[0]: execute_query(qr))
        button.grid(row=r, column=c, padx=10, pady=10)
        c += 1
        if c >= 2:
            c = 0
            r += 1
    



window = tk.Tk()
window.title("Healthcare Management System")

# User mode buttons
user_mode_frame = tk.Frame(window)
user_mode_label = tk.Label(user_mode_frame, text="Select User Mode:")
user_mode_label.pack()

admin_button = tk.Button(user_mode_frame, text="Admin", command=admin_mode)
admin_button.pack(side="left", padx=10)

employee_button = tk.Button(user_mode_frame, text="Employee", command=employee_mode)
employee_button.pack(side="left", padx=10)

patient_button = tk.Button(user_mode_frame, text="Patient", command=patient_mode)
patient_button.pack(side="left", padx=10)

user_mode_frame.pack()

# Buttons frame for options
options_frame = tk.Frame(window)
options_frame.pack(pady=20)

# Queries for different user roles
admin_queries = [
    ("select * from patient inner join patient_phone on patient.mrn=patient_phone.mrn", "Join patient + patient's phone number"),
    ("update patient_phone set phone=\"7735068524\" where mrn=\"1487426\"", "Update a phone number"),
    ("select * from (select name_first, name_last, bill.MRN, issue_date, amount, rank() over (order by amount desc) as \"Priority by Quantity\" from (patient inner join bill on patient.mrn = bill.mrn)) as table1", "Sort bill quantities in the hospital by quantity"),
    ("select * from (select name_first, name_last, bill.MRN, issue_date, amount, rank() over (order by due_date) as \"Priority by Issue Date\" from (patient inner join bill on patient.mrn = bill.mrn)) as table2", "Sort bill with dated payments priority"),
    ("select *, date_format(from_days(datediff(now(), DOB)), \"%Y\") + ntile(3) over(order by DOB desc) as \"age range\" from patient", "Find the age distribution in the patients"),
    ("select name_first, name_last, type, round(round(cume_dist() over(order by type), 2) * 100, 2) as \"Specialty Distribution(%)\" from doctor as Table1", "Group doctors by specialty and distribution"),
    ("Select * from nurse where EID = (SELECT EID FROM room GROUP BY EID HAVING COUNT(*) = 1)", "Get the info on nurses assigned to only one room"),
    ("Select MRN, patient.name_first, patient.name_last from patient, doctor Where patient.EID = doctor.EID and doctor.name_last =\'Barry\'", "Get the MRN and name from patients with Dr. Barry"),
    ("SELECT * FROM employee WHERE EXISTS (SELECT * FROM nurse WHERE nurse.EID = employee.EID)", "List all the employees that are nurses"),
    ("SELECT nurse.* FROM nurse INNER JOIN room ON nurse.EID = room.EID WHERE room.surgery_capable = 1;", "List all the nurses assigned to operating rooms"),
    ("SELECT * from nurse where type = \"Anesthetist\"", "get the info on nurses that are Anesthetists"),
    ("SELECT type, FORMAT(AVG(salary), 2) as average_salary FROM doctor GROUP BY type", "find the average salaries of each type of doctor"),
    ("""SELECT nurse.type as employee_type, employee_phone.EID, nurse.name_first,
                    nurse.name_last, employee_phone.phone
                    FROM employee_phone
                    LEFT JOIN nurse ON employee_phone.EID = nurse.EID
                    WHERE nurse.type IN ('Surgical', 'Anesthetist')
                    UNION
                    SELECT doctor.type as employee_type, employee_phone.EID, doctor.name_first,
                    doctor.name_last, employee_phone.phone
                    FROM employee_phone
                    LEFT JOIN doctor ON employee_phone.EID = doctor.EID
                    WHERE doctor.type = 'Surgeon'
                    Order by employee_type""", "list the phone numbers of employees that may be working in the operating room (Surgical and Anesthetist nurses and Surgeon doctors) and order it by employee type"),
    ("select *, TIMESTAMPDIFF(YEAR, DOB, CURDATE()) as \"age\" from patient Where TIMESTAMPDIFF(YEAR, DOB, CURDATE()) > 30", "Get info on all patients older than 30"),
    ("select amount from bill where datediff(due_date, curdate()) < 0", "Get amounts of late bills"),
    ("""Select employee.name_first, employee.name_last from employee,
                    (select EID from employee_phone group by EID having count(EID) > 1) as subquery
                    where employee.EID = subquery.EID;""", "Get names of employees with more than one phone number"),
    ("""Select doctor.name_first, doctor.name_last from doctor,
                    inner join(
                    (select * from report where timestampdiff(date, curdate()) <= 31)) as subquery
                    where doctor.EID = subquery.EID""", "Get doctors who have written at least one report in the past month"),
    ("select *, ntile(4) over (order by salary) from employee order by salary", "Separate employees into salary quartiles")
]

employee_queries = [
    ("SELECT CONCAT(nurse.name_last, ', ', nurse.name_first) AS name, room.number as room_assignment, patient.MRN AS patient_assignment FROM nurse INNER JOIN room ON nurse.EID = room.EID LEFT JOIN patient ON room.MRN = patient.MRN order by name", "Nurse Assignments"),
    ("SELECT CONCAT(doctor.name_last, ', ', doctor.name_first) AS name, room.number as room_assignment, patient.MRN AS patient_assignment FROM doctor, patient, room Where patient.EID = doctor.EID and patient.MRN = room.MRN order by name", "Doctor Assignments"),
    ("SELECT doctor.type AS department, CONCAT(employee.name_last, ', ', employee.name_first) AS name, employee_phone.phone as phone_number FROM employee, employee_phone, doctor, nurse Where employee.EID = employee_phone.EID and doctor.EID = employee.EID UNION SELECT doctor.type AS department, CONCAT(employee.name_last, ', ', employee.name_first) AS name, employee_phone.phone as phone_number FROM employee, employee_phone, doctor, nurse Where employee.EID = employee_phone.EID and nurse.EID = employee.EID ORDER BY department, name", "Employee Contact List"),
    ("nurse_query_1", "Nurse Query 1"),
    # ... (more doctor and nurse queries)
]

patient_queries = [
    ("select doctor.type as department, CONCAT(doctor.name_first, ' ', doctor.name_last) AS name, employee_phone.phone from doctor inner join employee_phone on doctor.EID=employee_phone.EID order by type", "Doctor Contact info"),
    ("select nurse.type as department, CONCAT(nurse.name_first, ' ', nurse.name_last) AS name, employee_phone.phone from nurse inner join employee_phone on nurse.EID=employee_phone.EID order by type", "Nurse Contact info"),
    ("patient_query_1", "patient Query 1"),
    # ... (more patient queries)
]

buttons = Frame(window)
results = Frame(window)

buttons.pack()
results.pack()

window.mainloop()



cursor.close()
connection.close()