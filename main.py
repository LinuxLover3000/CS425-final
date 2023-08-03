import mysql.connector
from tkinter import *
import tkinter as tk
from tkinter import messagebox


connection = mysql.connector.connect(
    host = "4.tcp.ngrok.io",
    port = 16581,
    user = "project_python",
    password = "password",
    database = "cs425_healthcare_mgmt_sys"
)
cursor = connection.cursor()

def display_results(columns, data):
    for widget in results.winfo_children():
        widget.destroy()
    for i in range(len(columns)):
        entry = Entry(results, width = 20, fg = "black", font = ("Arial", 12))
        entry.grid(row = 0, column = i)
        entry.insert(END, columns[i])
    
    for i in range(len(data)):
        for j in range(len(data[0])):
            entry = Entry(results, width = 20, fg = "black", font = ("Arial", 12))
            entry.grid(row = i+1, column = j)
            entry.insert(END, data[i][j])

def execute_query(query):
    arr = []
    try:
        cursor.execute(query)
    except:
        print("sql error")
    for item in cursor:
        arr.append(item)
    display_results(cursor.column_names, arr)

def func(n):
    execute_query(queries[n][0])

def admin_mode():
    clear_options()
    show_buttons(queries)

def employee_mode():
    clear_options()
    show_buttons(patient_nurse_queries)

def patient_mode():
    clear_options()
    show_buttons(doctor_nurse_queries)

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
queries = [
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

patient_nurse_queries = [
    ("patient_query_1", "Patient Query 1"),
    ("nurse_query_1", "Nurse Query 1"),
    # ... (more patient and nurse queries)
]

doctor_nurse_queries = [
    ("doctor_query_1", "Doctor Query 1"),
    ("nurse_query_1", "Nurse Query 1"),
    # ... (more doctor and nurse queries)
]

buttons = Frame(window)
results = Frame(window)

buttons.pack()
results.pack()

window.mainloop()



cursor.close()
connection.close()