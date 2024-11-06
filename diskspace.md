Certainly! Here’s the answer formatted in Markdown:

---

# Disk Space Monitoring Script

This script will monitor your disk space usage and send an email alert if it exceeds a set threshold (e.g., 95%). The alert will only be sent once per threshold breach, and it will reset when usage falls below the threshold.

## Step 1: Define the Script

```bash
#!/bin/bash

# Define the threshold percentage for disk usage
THRESHOLD=95

# Define the email recipient and subject
EMAIL="your_email@example.com"
SUBJECT="Disk Space Alert: Usage Above ${THRESHOLD}%"

# Define a temporary file to store the state of the alert
ALERT_FILE="/tmp/disk_alert_sent"

# Disk usage check command (replace with your command, assuming output format as described)
# Example: Using `df` command, extract usage percentage and convert it to an integer.
USAGE_COMMAND="df --output=pcent / | tail -1 | tr -d '%' | awk '{print $1}'"

# Run the disk usage check and extract the current usage percentage
CURRENT_USAGE=$(eval $USAGE_COMMAND)

# Check if the usage exceeds the threshold
if [ "$CURRENT_USAGE" -gt "$THRESHOLD" ]; then
    # If usage exceeds threshold and alert has not been sent
    if [ ! -f "$ALERT_FILE" ]; then
        # Send the email alert
        echo "Warning: Disk usage is at ${CURRENT_USAGE}%." | mail -s "$SUBJECT" "$EMAIL"
        
        # Create a file to indicate that an alert was sent
        touch "$ALERT_FILE"
    fi
else
    # If usage is below the threshold, remove the alert file to reset
    [ -f "$ALERT_FILE" ] && rm "$ALERT_FILE"
fi
```

## Step 2: Explanation

- **Threshold and Email Settings**: The `THRESHOLD` and `EMAIL` variables allow you to set the usage limit and the recipient’s email address.
- **Temporary File**: `ALERT_FILE` is used to store the state of whether an alert has been sent. This file will only exist if an alert has been sent for the current session of high disk usage.
- **Disk Usage Check Command**: Adjust the `USAGE_COMMAND` variable to fit the command you use to get your current disk usage. The example assumes you’re using the `df` command and extracts the percentage as an integer.
- **Alert Logic**:
  - If `CURRENT_USAGE` is above the threshold and no alert has been sent (checked by the absence of `ALERT_FILE`), an email is sent, and the file is created.
  - If usage drops below the threshold, the alert file is removed, resetting the alert status.

## Step 3: Schedule the Script

To check disk space at regular intervals, use a cron job. Here’s an example to check every 5 minutes:

1. Open the crontab for editing:

   ```bash
   crontab -e
   ```

2. Add the following line to check every 5 minutes:

   ```bash
   */5 * * * * /path/to/your_script.sh
   ```

This setup will check the disk usage every 5 minutes and send an alert only once when the threshold is exceeded, resetting once usage drops below 95%.

--- 

This Markdown formatting makes it easy to read and understand the structure of the script and setup. Let me know if you need further customization!
