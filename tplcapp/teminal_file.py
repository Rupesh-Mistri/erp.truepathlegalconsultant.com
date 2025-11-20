import subprocess
import os
import json
from django.http import JsonResponse
from django.shortcuts import render

def terminal_func(command):
    try:
        output = subprocess.check_output(command, shell=True, text=True)
        return JsonResponse({"status": "success", "output": output})
    except subprocess.CalledProcessError as e:
        return JsonResponse({"status": "error", "message": str(e)})


def terminal_function(command):
    # Define allowed commands for Linux and Windows
    # allowed_commands_linux = [
    #     # General system commands
    #     "ls", "pwd", "whoami", "df -h", "uptime", "free -m", "uname -a", "id",
    #     "ps aux", "top -b -n 1", "vmstat", "iostat", "netstat -tulnp", "ifconfig",
    #     "ip a", "ip r", "ss -tulnp", "hostname", "date", "cal", "echo",
    #     "cat /etc/os-release", "cat /proc/cpuinfo", "cat /proc/meminfo", "env", "w",

    #     # ✅ MySQL Commands
    #     "mysql --version", "systemctl status mysql", "systemctl restart mysql",
    #     "systemctl stop mysql", "systemctl start mysql", "mysqladmin -u root -p status",
    #     "mysqladmin -u root -p processlist", "mysqladmin -u root -p variables",
    #     "mysqladmin -u root -p version", "mysqlshow -u root -p",
    #     "mysql -u root -p -e 'SHOW DATABASES;'", "mysql -u root -p -e 'SHOW PROCESSLIST;'",
    #     "mysql -u root -p -e 'SELECT user, host FROM mysql.user;'",
    #     "mysqldump --version", "mysqldump -u root -p database_name > backup.sql",
    #     "mysql -u root -p database_name < backup.sql",

    #     # ✅ Nginx Commands
    #     "nginx -v", "systemctl status nginx", "systemctl restart nginx",
    #     "systemctl stop nginx", "systemctl start nginx", "nginx -t",
    #     "cat /etc/nginx/nginx.conf", "ls /etc/nginx/sites-available",
    #     "ls /etc/nginx/sites-enabled", "netstat -tulnp | grep nginx",

    #     # ✅ Apache Commands
    #     "apachectl -v", "systemctl status apache2", "systemctl restart apache2",
    #     "systemctl stop apache2", "systemctl start apache2", "systemctl status httpd",
    #     "systemctl restart httpd", "systemctl stop httpd", "systemctl start httpd",
    #     "apachectl configtest", "cat /etc/apache2/apache2.conf",
    #     "cat /etc/httpd/conf/httpd.conf", "ls /etc/apache2/sites-available",
    #     "ls /etc/apache2/sites-enabled", "netstat -tulnp | grep apache",
    # ]

    allowed_commands_linux = [
        # General system commands
        "ls", "pwd", "whoami", "df -h", "uptime", "free -m", "uname -a", "id", 
        "ps aux", "top -b -n 1", "vmstat", "iostat", "netstat -tulnp", "ifconfig", 
        "ip a", "ip r", "ss -tulnp", "hostname", "date", "cal", "echo", 
        "cat /etc/os-release", "cat /proc/cpuinfo", "cat /proc/meminfo", "env", "w",

        # ✅ MySQL Commands
        "mysql --version",                      # Check MySQL version
        "systemctl status mysql",               # Check MySQL service status
        "systemctl restart mysql",              # Restart MySQL (requires sudo)
        "systemctl stop mysql",                 # Stop MySQL (requires sudo)
        "systemctl start mysql",                # Start MySQL (requires sudo)
        "mysqladmin -u root -p status",         # Check MySQL server status
        "mysqladmin -u root -p processlist",    # Show active MySQL connections
        "mysqladmin -u root -p variables",      # Show MySQL server variables
        "mysqladmin -u root -p version",        # Show MySQL version details
        "mysqlshow -u root -p",                 # List MySQL databases
        "mysql -u root -p -e 'SHOW DATABASES;'",# Show MySQL databases (query)
        "mysql -u root -p -e 'SHOW PROCESSLIST;'",  # Show running MySQL processes
        "mysql -u root -p -e 'SELECT user, host FROM mysql.user;'",  # Show users
        "mysqldump --version",                  # Check mysqldump version
        "mysqldump -u root -p database_name > backup.sql",  # Backup MySQL database
        "mysql -u root -p database_name < backup.sql",  # Restore MySQL database

        # ✅ Nginx Commands
        "nginx -v",                             # Check Nginx version
        "systemctl status nginx",               # Check Nginx service status
        "systemctl restart nginx",              # Restart Nginx (requires sudo)
        "systemctl stop nginx",                 # Stop Nginx (requires sudo)
        "systemctl start nginx",                # Start Nginx (requires sudo)
        "nginx -t",                             # Test Nginx configuration
        "cat /etc/nginx/nginx.conf",            # Show main Nginx config
        "cat /etc/nginx/sites-available/default",  # Show default site config
        "ls /etc/nginx/sites-available",        # List available Nginx sites
        "ls /etc/nginx/sites-enabled",          # List enabled Nginx sites
        "netstat -tulnp | grep nginx",          # Check Nginx running ports

        # ✅ Apache Commands
        "apachectl -v",                         # Check Apache version
        "systemctl status apache2",             # Check Apache service status (Ubuntu)
        "systemctl restart apache2",            # Restart Apache (Ubuntu, requires sudo)
        "systemctl stop apache2",               # Stop Apache (Ubuntu, requires sudo)
        "systemctl start apache2",              # Start Apache (Ubuntu, requires sudo)
        "systemctl status httpd",               # Check Apache service status (CentOS/RHEL)
        "systemctl restart httpd",              # Restart Apache (CentOS/RHEL, requires sudo)
        "systemctl stop httpd",                 # Stop Apache (CentOS/RHEL, requires sudo)
        "systemctl start httpd",                # Start Apache (CentOS/RHEL, requires sudo)
        "apachectl configtest",                 # Test Apache configuration
        "cat /etc/apache2/apache2.conf",        # Show main Apache config (Ubuntu)
        "cat /etc/httpd/conf/httpd.conf",       # Show main Apache config (CentOS)
        "ls /etc/apache2/sites-available",      # List available Apache sites (Ubuntu)
        "ls /etc/apache2/sites-enabled",        # List enabled Apache sites (Ubuntu)
        "netstat -tulnp | grep apache",         # Check Apache running ports
    ]
    allowed_commands_python = [
        # Python Version & Environment
        "python --version",
        "python3 --version",
        "python -V",
        "python3 -V",
        "which python",
        "which python3",
        "whereis python",
        "whereis python3",

        # Virtual Environments
        "python -m venv venv",          # Create a virtual environment
        "source venv/bin/activate",     # Activate virtual environment (Linux/macOS)
        "deactivate",                   # Deactivate virtual environment
        "rm -rf venv",                  # Remove virtual environment

        # Pip (Package Manager)
        "pip --version",
        "pip3 --version",
        "pip list",
        "pip freeze",
        "pip show <package_name>",
        "pip install <package_name>",
        "pip install -r requirements.txt",
        "pip uninstall <package_name>",
        "pip check",  # Check installed package dependencies
        "pip cache purge",  # Clear pip cache

        # Python Interactive Shell
        "python",
        "python3",
        "python -c 'print(\"Hello, World!\")'",
        "python3 -c 'print(\"Hello, World!\")'",

        # Running Python Scripts
        "python script.py",
        "python3 script.py",

        # Checking Installed Modules
        "python -m pip list",
        "python -m pip freeze",
        "python3 -m pip list",
        "python3 -m pip freeze",

        # Python Package Management via pip
        "python -m ensurepip",  # Ensure pip is installed
        "python -m pip install --upgrade pip",  # Upgrade pip
        "pip install --upgrade setuptools wheel",  # Upgrade setuptools & wheel

        # Virtual Environment (venv)
        "python -m venv env",
        "source env/bin/activate",
        "deactivate",

        # Python Package Index (PyPI)
        "pip search <package_name>",  # Search for a package on PyPI
        "pip download <package_name>",  # Download a package without installing

        # Python Debugging
        "python -m pdb script.py",  # Run Python debugger
        "python3 -m pdb script.py",

        # Running Python HTTP Server
        "python -m http.server",  # Default port 8000
        "python3 -m http.server 8080",  # Custom port 8080

        # Checking Python Processes
        "ps aux | grep python",
        "pgrep -l python",

        # Jupyter Notebook & IPython
        "jupyter notebook",
        "jupyter lab",
        "jupyter kernelspec list",
        "jupyter nbconvert --to html notebook.ipynb",
        "ipython",
        "ipython -c 'print(\"Hello from IPython\")'",

        # Conda (if installed)
        "conda --version",
        "conda list",
        "conda env list",
        "conda create -n myenv python=3.9",
        "conda activate myenv",
        "conda deactivate",
        "conda remove --name myenv --all",

        # Python Code Formatting & Linting
        "black script.py",  # Format code using Black
        "flake8 script.py",  # Lint code using flake8
        "pylint script.py",  # Static code analysis

        # Running Python Unit Tests
        "pytest test_script.py",
        "python -m unittest test_script.py",

        # Performance Monitoring
        "python -m timeit 'sum(range(1000))'",

        # Exiting the Python Shell
        "exit()",
        "quit()"
    ]
    # allowed_commands_linux=allowed_commands_linux+allowed_commands_python
    # print(allowed_commands_linux)

    allowed_commands_windows = [
        "dir", "cd", "whoami", "echo %USERNAME%", "systeminfo", "ipconfig",
        "ipconfig /all", "hostname", "tasklist", "netstat -ano", "getmac",
        "wmic cpu get caption", "wmic os get caption", "date /T", "time /T",
        "ver", "set", "echo %PATH%"
    ]
    
    allowed_commands_git = [
    # Setup & config
    "git help",
    "git config",
    "git init",
    "git clone",

    # Basic snapshotting
    "git add",
    "git status",
    "git diff",
    "git commit",
    "git reset",
    "git rm",
    "git mv",

    # Branching & merging
    "git branch",
    "git checkout",
    "git switch",
    "git merge",
    "git mergetool",
    "git rebase",
    "git stash",
    "git stash list",
    "git stash pop",
    "git stash drop",

    # Sharing & updating
    "git fetch",
    "git pull",
    "git push",
    "git remote",
    "git submodule",

    # Inspection & comparison
    "git log",
    "git show",
    "git diff",
    "git shortlog",
    "git describe",
    "git blame",
    "git bisect",
    "git grep",
    "git reflog",
    "git tag",
    "git notes",

    # Patching & plumbing
    "git apply",
    "git cherry-pick",
    "git revert",
    "git archive",
    "git bundle",
    "git fast-export",
    "git fast-import",

    # Debugging & maintenance
    "git fsck",
    "git gc",
    "git clean",
    "git filter-branch",
    "git instaweb",
    "git replace",
    "git verify-commit",
    "git verify-tag",

    # Advanced & low-level (plumbing)
    "git cat-file",
    "git check-attr",
    "git check-ignore",
    "git check-ref-format",
    "git count-objects",
    "git for-each-ref",
    "git hash-object",
    "git index-pack",
    "git ls-files",
    "git ls-remote",
    "git ls-tree",
    "git merge-base",
    "git pack-objects",
    "git rev-list",
    "git rev-parse",
    "git show-ref",
    "git symbolic-ref",
    "git update-index",
    "git update-ref",
    "git verify-pack",
    "git write-tree",

    # Email workflows
    "git am",
    "git format-patch",
    "git send-email",
    "git request-pull",
    "git imap-send",
    "git mailinfo",
    "git mailsplit",

    # Server-side
    "git daemon",
    "git upload-pack",
    "git receive-pack",
    "git upload-archive",
    "git http-backend",
    "git shell",

    # Interactive tools
    "git citool",
    "git gui",
    "gitk",

    # Experimental (some builds only)
    "git sparse-checkout",
    "git worktree",
    "git maintenance",
]


    # Detect OS
    if os.name == "posix":  # Linux/macOS
        allowed_commands = allowed_commands_linux+allowed_commands_python+allowed_commands_git
    elif os.name == "nt":  # Windows
        allowed_commands = allowed_commands_windows+allowed_commands_python+allowed_commands_git
    else:
        return JsonResponse({"status": "error", "message": "Unsupported OS"})

    # Check if command is allowed
    if command not in allowed_commands:
        return JsonResponse({"status": "error", "message": "Command not allowed!"})

    try:
        output = subprocess.check_output(command, shell=True, text=True)
        return JsonResponse({"status": "success", "output": output})
    except subprocess.CalledProcessError as e:
        return JsonResponse({"status": "error", "message": str(e)})





"""

import subprocess
import os

def terminal(request):
    if request.method == "POST":
        command = request.POST.get("command", "").strip()

        # Define allowed commands for Linux and Windows
        allowed_commands_linux = [
            # General system commands
            "ls", "pwd", "whoami", "df -h", "uptime", "free -m", "uname -a", "id", 
            "ps aux", "top -b -n 1", "vmstat", "iostat", "netstat -tulnp", "ifconfig", 
            "ip a", "ip r", "ss -tulnp", "hostname", "date", "cal", "echo", 
            "cat /etc/os-release", "cat /proc/cpuinfo", "cat /proc/meminfo", "env", "w",

            # ✅ MySQL Commands
            "mysql --version",                      # Check MySQL version
            "systemctl status mysql",               # Check MySQL service status
            "systemctl restart mysql",              # Restart MySQL (requires sudo)
            "systemctl stop mysql",                 # Stop MySQL (requires sudo)
            "systemctl start mysql",                # Start MySQL (requires sudo)
            "mysqladmin -u root -p status",         # Check MySQL server status
            "mysqladmin -u root -p processlist",    # Show active MySQL connections
            "mysqladmin -u root -p variables",      # Show MySQL server variables
            "mysqladmin -u root -p version",        # Show MySQL version details
            "mysqlshow -u root -p",                 # List MySQL databases
            "mysql -u root -p -e 'SHOW DATABASES;'",# Show MySQL databases (query)
            "mysql -u root -p -e 'SHOW PROCESSLIST;'",  # Show running MySQL processes
            "mysql -u root -p -e 'SELECT user, host FROM mysql.user;'",  # Show users
            "mysqldump --version",                  # Check mysqldump version
            "mysqldump -u root -p database_name > backup.sql",  # Backup MySQL database
            "mysql -u root -p database_name < backup.sql",  # Restore MySQL database

            # ✅ Nginx Commands
            "nginx -v",                             # Check Nginx version
            "systemctl status nginx",               # Check Nginx service status
            "systemctl restart nginx",              # Restart Nginx (requires sudo)
            "systemctl stop nginx",                 # Stop Nginx (requires sudo)
            "systemctl start nginx",                # Start Nginx (requires sudo)
            "nginx -t",                             # Test Nginx configuration
            "cat /etc/nginx/nginx.conf",            # Show main Nginx config
            "cat /etc/nginx/sites-available/default",  # Show default site config
            "ls /etc/nginx/sites-available",        # List available Nginx sites
            "ls /etc/nginx/sites-enabled",          # List enabled Nginx sites
            "netstat -tulnp | grep nginx",          # Check Nginx running ports

            # ✅ Apache Commands
            "apachectl -v",                         # Check Apache version
            "systemctl status apache2",             # Check Apache service status (Ubuntu)
            "systemctl restart apache2",            # Restart Apache (Ubuntu, requires sudo)
            "systemctl stop apache2",               # Stop Apache (Ubuntu, requires sudo)
            "systemctl start apache2",              # Start Apache (Ubuntu, requires sudo)
            "systemctl status httpd",               # Check Apache service status (CentOS/RHEL)
            "systemctl restart httpd",              # Restart Apache (CentOS/RHEL, requires sudo)
            "systemctl stop httpd",                 # Stop Apache (CentOS/RHEL, requires sudo)
            "systemctl start httpd",                # Start Apache (CentOS/RHEL, requires sudo)
            "apachectl configtest",                 # Test Apache configuration
            "cat /etc/apache2/apache2.conf",        # Show main Apache config (Ubuntu)
            "cat /etc/httpd/conf/httpd.conf",       # Show main Apache config (CentOS)
            "ls /etc/apache2/sites-available",      # List available Apache sites (Ubuntu)
            "ls /etc/apache2/sites-enabled",        # List enabled Apache sites (Ubuntu)
            "netstat -tulnp | grep apache",         # Check Apache running ports
        ]


        allowed_commands_windows = [
            "dir", "cd", "whoami", "echo %USERNAME%", "systeminfo", "ipconfig", 
            "ipconfig /all", "hostname", "tasklist", "netstat -ano", "getmac", 
            "wmic cpu get caption", "wmic os get caption", "date /T", "time /T", 
            "ver", "set", "echo %PATH%"
        ]

        # Detect OS using os.name
        if os.name == "posix":  # Linux/macOS
            allowed_commands = allowed_commands_linux
        elif os.name == "nt":  # Windows
            allowed_commands = allowed_commands_windows
        else:
            return JsonResponse({"status": "error", "message": "Unsupported OS"})

        # Check if command is allowed
        if command not in allowed_commands:
            return JsonResponse({"status": "error", "message": "Command not allowed!"})

        try:
            output = subprocess.check_output(command, shell=True, text=True)
            return JsonResponse({"status": "success", "output": output})
        except subprocess.CalledProcessError as e:
            return JsonResponse({"status": "error", "message": str(e)})

    return render(request, "terminal.html")

"""