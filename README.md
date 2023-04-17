## PowerShell Web Request Automator
[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)

This PowerShell script automates the process of sending requests to a target website using a list of proxies. It repeatedly sends requests to the specified website using a randomly selected proxy from the provided list, and logs the successful and failed visits.

## Requirements

PowerShell 5.1 or later

## Usage

Clone the repository or download the script file to your local machine.

Open PowerShell and navigate to the directory containing the script.

Execute the script by running ./<script-name>.ps1.

When prompted, provide the target website URL (e.g. https://www.example.com).

When prompted, provide the path to a text file containing a list of proxies. The file should have one proxy per line in the following format:
  
    <proxy-ip>:<proxy-port>
      
The script will run continuously, sending requests to the target website every 5 seconds using a randomly selected proxy. Successful and failed visits will be logged in the PowerShell console.
      
## Example Output
      
    OK - Visit Count 1 - Time: 10:30:45
    Failed to connect using proxy 203.0.113.10:8080 - Failed Count 1 - Time: 10:30:50
    OK - Visit Count 2 - Time: 10:30:55
    Failed to connect using proxy 198.51.100.15:3128 - Failed Count 2 - Time: 10:31:0
      
## Known bugs/issues

Visit count accuracy will be determined by two things - quality of proxies and if you're logged in as a user or not. This script uses a basic GET request, so it won't pick up your credentials.. Adjust accordingly.
      
## License

This project is available under the MIT License - https://opensource.org/license/mit/
      
TL;DR: Do whatever you'd like with this code, I take no repsonsibility for any damage caused by this code and everything you see here is provided as-is.
      
## Disclaimer

Please use this script responsibly and in compliance with the target website's terms of service. Sending automated requests might be against the terms of service of certain websites, and the use of proxies might be prohibited as well. The author of this script is not responsible for any damages or legal consequences resulting from its usage.
