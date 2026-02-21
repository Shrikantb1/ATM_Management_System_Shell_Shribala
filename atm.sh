#!/bin/bash

# ==========================================
#           ATM MANAGEMENT SYSTEM
# ==========================================

# -------- Welcome Screen --------
Welcome_Screen() {

    clear

    spin=('⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏')

    echo " 🔄  Starting ATM System..."
    for i in {1..20}; do
        printf "\r  ${spin[$((i % 10))]}  Please wait..."
        sleep 0.1
    done
    printf "\r  ✅  System Ready!          \n\n"

    echo "=============================================="
    echo "       ╔══════════════════════╗"
    echo "       ║   🏧 ATM MANAGEMENT  ║"
    echo "       ║       SYSTEM         ║"
    echo "       ╚══════════════════════╝"
    echo "=============================================="

    while true
    do
        read -p "Do you want to proceed? (y/n): " choice
        case $choice in
            y|Y) Customer_Details; break ;;
            n|N)
                echo "✨ Thank You for Visiting ✨"
                exit 0
                ;;
            *) echo "Invalid input! Enter y or n." ;;
        esac
    done
}

# -------- Customer Details --------
Customer_Details() {

    echo "╔══════════════════════════════════════╗"
    echo "║                                      ║"
    echo "║   🏦  NEW ACCOUNT CREATION  🏦       ║"
    echo "║                                      ║"
    echo "╠══════════════════════════════════════╣"
    echo "║   🚀  Let's set up your account!     ║"
    echo "║   ✍️  Fill in your details below     ║"
    echo "║   🔐  Your data is safe with us      ║"
    echo "║   📋  All fields are mandatory       ║"
    echo "╚══════════════════════════════════════╝"

    # First Name Validation
    while true
    do
        read -p "Enter Customers First Name : " fname
        [[ $fname =~ ^[A-Za-z]+$ ]] && break
        echo "Error: Only Alphabets allowed."
    done

    # ID Type selection
    echo ""
    echo "🪪 Select ID Type:"
    echo "1. Aadhar"
    echo "2. PAN"
    echo "3. Driving License"

    while true
    do
        read -p "Enter choice (1/2/3): " id_choice
        case $id_choice in
            1)
                id_type="Aadhar"
                while true
                do
                    read -p "Enter your 12 digit Aadhar Number : " id_number
                    [[ $id_number =~ ^[0-9]{12}$ ]] && break
                    echo "⚠️  Error: Aadhar must be exactly 12 digits and numeric only! 🔢"
                done
                break
                ;;
            2)
                id_type="PAN"
                while true
                do
                    read -p "Enter PAN Number: " id_number
                    [[ $id_number =~ ^[A-Za-z0-9]+$ ]] && break
                    echo "Error: Only alphabets and numbers allowed!"
                done
                break
                ;;
            3)
                id_type="Driving License"
                while true
                do
                    read -p "Enter Driving License Number: " id_number
                    [[ $id_number =~ ^[A-Za-z0-9]+$ ]] && break
                    echo "Error: Only alphabets and numbers allowed!"
                done
                break
                ;;
            *)
                echo "🚫 Invalid choice! Please select 1, 2 or 3."
                ;;
        esac
    done

    # Account Type
    echo ""
    echo "Select Account Type:"
    echo "S - Saving"
    echo "C - Current"
    while true
    do
        read -p "Enter choice (S/C): " acc_type
        [[ $acc_type =~ ^[Ss]$ ]] && account="Saving" && break
        [[ $acc_type =~ ^[Cc]$ ]] && account="Current" && break
        echo "⚠️  Invalid option! Please enter S for Saving or C for Current only."
    done

    # Initial Deposit (multiples of 100)
    while true
    do
        read -p "💵 Enter Deposit Amount : " balance
        if [[ $balance =~ ^[0-9]+$ ]] && (( balance % 100 == 0 )); then
            break
        else
            echo "Error: Amount must be numeric and a multiple of 100.💵"
        fi
    done

    GREEN='\033[0;32m'
    YELLOW='\033[1;33m'
    CYAN='\033[0;36m'
    BOLD='\033[1m'
    RESET='\033[0m'

    echo ""
    echo -e "${GREEN}${BOLD}  ╔══════════════════════════════════════════╗${RESET}"
    echo -e "${YELLOW}${BOLD}  ║   🎉  ACCOUNT CREATED SUCCESSFULLY!      ║${RESET}"
    echo -e "${GREEN}${BOLD}  ║                                          ║${RESET}"
    echo -e "${CYAN}${BOLD}  ║   👤  Name        : $fname               ${GREEN}  ║${RESET}"
    echo -e "${CYAN}${BOLD}  ║   🪪  ID Type     : $id_type             ${GREEN}     ║${RESET}"
    echo -e "${CYAN}${BOLD}  ║   🏦  Account     : $account             ${GREEN}  ║${RESET}"
    echo -e "${CYAN}${BOLD}  ║   💰  Balance     : $balance             ${GREEN}    ║${RESET}"
    echo -e "${GREEN}${BOLD}  ║                                          ║${RESET}"
    echo -e "${GREEN}${BOLD}  ║   🌟  Welcome to our banking family!     ║${RESET}"
    echo -e "${GREEN}${BOLD}  ╚══════════════════════════════════════════╝${RESET}"
    echo ""

    Customer_Choice
}

# -------- Customer Choice --------
Customer_Choice() {

    echo ""
    echo "================================="
    echo "       💳 ATM CARD SECTION"
    echo "================================="

    while true
    do
        read -p "💳 Do you want to apply for ATM Card? (y/n): " card_choice

        case $card_choice in
            y|Y)
                pin=$(( RANDOM % 9000 + 1000 ))
                echo -e "💳 ATM Card Generated Successfully! ✅"
                echo -e "🔐 Your 4-digit PIN is: $pin  ⚠️  Do not share this with anyone!"
                echo ""
                while true
                do
                    read -p "Do you want to access ATM now? (y/n): " access_choice
                    case $access_choice in
                        y|Y)
                            PIN_Verification
                            break 2
                            ;;
                        n|N)
                            echo "✨ Thank you for choosing our banking service! ✨"
                            exit 0
                            ;;
                        *)
                            echo "Invalid input! Enter y or n."
                            ;;
                    esac
                done
                ;;
            n|N)
                echo "✨ Thank you for choosing our banking service! ✨"
                exit 0
                ;;
            *)
                echo "Invalid input! Enter y or n."
                ;;
        esac
    done
}

# -------- PIN Verification --------
PIN_Verification() {

    attempts=0
    while (( attempts < 3 ))
    do
        read -s -p "🔐 Enter your 4-digit PIN: " entered_pin
        echo ""
        if [[ "$entered_pin" == "$pin" ]]; then
            echo "🔓 PIN Verified Successfully! "
            ATM_Process
            return
        else
            echo "❌ Incorrect PIN!"
            ((attempts++))
        fi
    done

    
    RED='\033[0;31m'
    BOLD='\033[1m'
    BLINK='\033[5m'
    RESET='\033[0m'
    echo ""
    echo -e "${RED}${BOLD}  ╔══════════════════════════════════════════╗${RESET}"
    echo -e "${RED}${BOLD}  ║  🚨  SECURITY ALERT                      ║${RESET}"
    echo -e "${RED}${BOLD}  ║                                          ║${RESET}"
    echo -e "${RED}${BLINK}  ║   ❌  TOO MANY FAILED ATTEMPTS  ❌       ║${RESET}"
    echo -e "${RED}${BOLD}  ║                                          ║${RESET}"
    echo -e "${RED}${BOLD}  ║  🔒  Your Card Has Been BLOCKED!         ║${RESET}"
    echo -e "${RED}${BOLD}  ║  📞  Please Contact Your Bank.           ║${RESET}"
    echo -e "${RED}${BOLD}  ╚══════════════════════════════════════════╝${RESET}"
    echo ""

    exit 1
}

# -------- ATM Process with Exit  --------
ATM_Process() {

    while true
    do
        
        echo "╔══════════════════════════╗"
        echo "║     🏧  ATM MENU         ║"
        echo "╠══════════════════════════╣"
        echo "║  1.   Display Balance    ║"
        echo "║  2.  Withdraw Amount    ║"
        echo "║  3.  Deposit Amount     ║"
        echo "║  4.  Exit               ║"
        echo "╚══════════════════════════╝"

        read -p "Select option (1/2/3/4): " option

        case $option in
            1)
                echo "💰 Current Balance: ₹$balance"

                ;;
            2)
                # Withdraw
                while true
                do
                    read -p "Enter amount to withdraw: " withdraw_amt
                    if [[ $withdraw_amt =~ ^[0-9]+$ ]]; then
                        if (( withdraw_amt % 100 == 0 )); then
                            if (( withdraw_amt <= balance )); then
                                balance=$(( balance - withdraw_amt ))
                                echo "✅ Transaction Complete!"
                                echo "✅ Withdrawal successful! Updated Balance: $balance"
                                break
                            else
                                echo "⚠️  Error: Insufficient balance! 💸 Please enter a lower amount."

                            fi
                        else
                            echo "Error: Amount must be a numeric value in multiples of 100."
                        fi
                    else
                        echo "Error: Enter numeric value only."
                    fi
                done
                ;;
            3)
                # Deposit
                while true
                do
                    read -p "Enter amount to deposit : " deposit_amt
                    if [[ $deposit_amt =~ ^[0-9]+$ ]]; then
                        if (( deposit_amt % 100 == 0 )); then
                            balance=$(( balance + deposit_amt ))
                            echo "✅ Transaction Complete!"
                            echo "✅ Deposit successful! Updated Balance: $balance"
                            break
                        else
                            echo "Error: Amount must be in multiples of 100"
                        fi
                    else
                        echo "Error: Enter numeric value only."
                    fi
                done
                ;;
            4)
                echo "╔══════════════════════════════════════════════╗"
                echo "║  🙏  THANK YOU FOR BANKING WITH US!         ║"
                echo "║  🏦  We value your trust & loyalty.         ║"
                echo "║  🌟  Have a Wonderful Day!                  ║"
                echo "╚══════════════════════════════════════════════╝"
                exit 0
                ;;
            *)
                echo "🚫 Invalid option! Please choose 1, 2, 3 or 4."
                continue
                ;;
        esac

        # Continue transaction prompt with Re-PIN
        while true
        do
            read -p "🔄 Do you want to perform another transaction? (y/n): " cont

            case $cont in
                y|Y)
                    # Ask for PIN again
                    PIN_Verification
                    break
                    ;;
                n|N)
                    echo "╔══════════════════════════════════════════════╗"
                    echo "║  🙏  THANK YOU FOR BANKING WITH US!         ║"
                    echo "║  🏦  We value your trust & loyalty.         ║"
                    echo "║  🌟  Have a Wonderful Day!                  ║"
                    echo "╚══════════════════════════════════════════════╝"
                    exit 0
                    ;;
                *)
                    echo "Invalid input! Please enter y or n."
                    ;;
            esac
        done
    done
}

# -------- Program Starts Here --------
Welcome_Screen