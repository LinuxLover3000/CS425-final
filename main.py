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

#print(cursor.__dir__())
#print(cursor.column_names)

window = Tk()

#(query, desc)
queries = [
                ("select * from patient inner join patient_phone on patient.mrn=patient_phone.mrn", "Join patient + patient's phone number"),
                ("update patient_phone set phone=\"7735068524\" where mrn=\"1487426\"", "Update a phone number"),
                ("select * from (select name_first, name_last, bill.MRN, issue_date, amount, rank() over (order by amount desc) as \"Priority by Quantity\" from (patient inner join bill on patient.mrn = bill.mrn))", "Sort bill quantities in the hospital by quantity"),
                ("select * from (select name_first, name_last, bill.MRN, issue_date, amount, rank() over (order by due_date) as \"Priority by Issue Date\" from (patient inner join bill on patient.mrn = bill.mrn))", "Sort bill with dated payments priority"),
                ("select *, date_format(from_days(datediff(now(), DOB)), \"%Y\") + ntile(3) over(order by DOB desc) as \"age range\"", "Find the age distribution in the patients"),
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
                ("select * from patient_info where age > 30", "Get info on all patients older than 30"),
                ("select amount from bill where datediff(due_date, curdate()) < 0", "Get amounts of late bills"),
                ("""Select employee.name_first, employee.name_last from employee,
                    (select EID from employee_phone group by EID having count(EID) > 1) as subquery
                    where employee.EID = subquery.EID;""", "Get names of employees with more than one phone number"),
                ("""Select doctor.name_first, doctor.name_last from doctor,
                    (select * from report where datediff(date, curdate()) <= 31)) as subquery
                    where doctor.EID = subquery.EID""", "Get doctors who have written at least one report in the past month"),
                ("select *, ntile(4) over (order by salary) from employee order by salary", "Separate employees into salary quartiles")
           ]
#qr = "select * from doctor limit 5"
#execute_query(qr)

buttons = Frame(window)
results = Frame(window)
for i in range(len(queries)):
    r = int(i/5)
    button = Button(buttons, text = queries[i][1], command = lambda qr = queries[i][0]: execute_query(qr)) #execute_query(queries[i][0]))
    button.grid(row=r, column = i % 5)
buttons.pack()
results.pack()

window.mainloop()
cursor.close()
connection.close()