# ATM_Management_System_Shell_Shribala
Debit &amp; Credit Transaction Process on ATM Management System
Project Integration: Must Implement the concepts like Command Substitution, String
Manipulation, String Substitution, Pattern Matching, Functions, Control Structures, Arithmetic
Operation and Expansion, Error Handling wherever it is required, User Input must read from
User Side, Program must include proper Input Prompt Message and proper Output Status
Message to make user to have good Terminal Interaction.


Codes:
   ls
   mkdir ATM_Project
   cd ATM_Project
   touch atm.sh
   chmod +x atm.sh
   cd ATM_Project
   code .
   ./atm.sh
   ls
   *
   ./atm.sh
   cd ~/ATM_Project
   git init
   git add atm.sh
   git commit -m "Initial commit: ATM Management System"
   git remote add origin https://github.com/Shrikantb1/ATM_Management_System_Shell_Shribala.git
   git branch -M main
   git push -u origin main
   git pull origin main --allow-unrelated-histories
   git push -u origin main
   git pull origin main --allow-unrelated-histories
   git pull origin main --allow-unrelated-histories --no-rebase
   git push -u origin main

   Runtime Environment: Ubuntu (Linux) — the primary execution environment for running the Bash shell script
   Development Tools: Visual Studio Code (VS Code) — the code editor used to write the script, with WSL integration via the Remote - WSL extension

   Functions: Five dedicated functions structure the entire program flow: Customer_Details, Customer_Choice, ATM_Process, Debit_Process, and Credit_Process. Each function handles a specific responsibility, mimicking modular programming.
   Concepts used :
   1. Command Substitution: Used to capture the output of a command and store it in a variable.
   2. Pattern Matching: Used in case statements and [[ ]] conditions to validate user input — for example, checking if a value is numeric, matching menu choices like 1, 2,  and validating PIN or account number formats.
   3. Control Structures: The project makes heavy use of if-else blocks for conditional branching, case statements for menu-driven navigation, and while loops to keep the user in a prompt until valid input is received.
   4. Arithmetic Operations & Expansion: Used in both the Debit and Credit processes to calculate balances. Bash arithmetic expansion like $(( balance - amount )) and $(( balance + amount )) are used.
   5. User Input Handling (read): The read command with -p (prompt) flag is used throughout every function to collect user input — account name, PIN, balance etc.
   6. Error Handling: Input validation ensures the user cannot enter invalid data. Checks include: non-numeric amount entries, insufficient balance for debit, and wrong PIN or card number scenarios, each triggering appropriate error messages.

Flow of program: 
[Program Start]
      ↓
Customer_Details()     → Account creation (name, PIN, initial balance)
      ↓
Customer_Choice()      → ATM card access prompt 
      ↓
ATM_Process()          → Transaction menu (Press 1 = Balance, Press 2 = Credit, Press 3 = Debit, Press 4 = Exit)
     ↙         ↘                  ↘            ↘
Display   Debit_Process()  Credit_Process()     Exit
          (Withdraw Cash)  (Deposit Cash)

🔐 Security Techniques
read -s Hides PIN input from terminal display 
Attempt counter Blocks card after 3 wrong PIN entries
exit 1 Hard exit on security violation



