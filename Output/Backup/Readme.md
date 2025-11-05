## Example Menu Session:
```
===================================
  System Maintenance Suite Menu
===================================
1. Run System Backup
2. Run System Maintenance (Update & Clean)
3. Monitor System Logs (Check for 'Failed')
4. Exit
-----------------------------------
 (Logs are saved to maintenance_suite.log)
Enter your choice [1-4]: 1
```

## Example Output (when running Option 1):
```
Running backup script...
Starting backup of /home/username/documents...
tar: Removing leading `/' from member names
/home/username/documents/
/home/username/documents/file1.txt
/home/username/documents/report.pdf
Backup complete!
File created: /mnt/backups/my_project/backup_2025-11-06_12-35-01.tar.gz

Press Enter to return to the menu...
```

## Log File Output (maintenance_suite.log):
**After running a few tasks, the log file will contain a complete history:**
```
================ Thu Nov 6 12:35:01 AM IST 2025 ================
Running: Backup Script
-------------------------------------------------
Starting backup of /home/username/documents...
tar: Removing leading `/' from member names
/home/username/documents/
/home/username/documents/file1.txt
/home/username/documents/report.pdf
Backup complete!
File created: /mnt/backups/my_project/backup_2025-11-06_12-35-01.tar.gz
================ Thu Nov 6 12:35:15 AM IST 2025 ================
Running: Log Monitor Script
-------------------------------------------------
Starting log scan for 'Failed' in /var/log/auth.log...
----------------------------------------
ALERT: Potential issues found!
----------------------------------------
1024:Nov 6 12:22:01 my-pc sshd[54321]: Failed password for root from 192.168.1.10
----------------------------------------
```
