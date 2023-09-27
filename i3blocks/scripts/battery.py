import subprocess

info = subprocess.getoutput('acpi')
icon = ""
b_info = ""
batteries_info = info.split('\n')
for battery in batteries_info:
    if not 'rate' in battery:
        b_info = battery

charge=int(b_info[b_info.find(",")+1:b_info.find("%")])

if("Charging" in info):
    icon = ""
else:
    if(charge>87):
        icon=" "
    elif(charge>63):
        icon=" "
    elif(charge>40):
        icon=" "
    elif(charge>15):
        icon=" "
    else:
        icon=" "
print(icon+" "+str(charge)+"%")
