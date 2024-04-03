#!/bin/bash

# 收件人邮箱地址
recipient="1094488315@qq.com"

# 发件人邮箱地址
sender="mingjieyang1029@gmail.com"

# SMTP服务器地址和端口
smtp_server="smtp.gmail.com"
smtp_port="587"

# 发件人的SMTP账户和密码
smtp_user="mingjie"
smtp_password='ymj1029'

# 构建邮件内容
subject="Test email"
body="This is a test email sent from Bash script using msmtp."

# 构建邮件头
headers="From: mingjie
To: 1094488315@qq.com
Subject: Test email
Content-Type: text/plain; charset=UTF-8";

# 使用echo将邮件头和正文传递给msmtp
printf "%s\n\n%s\n" "$headers" "$body" | msmtp --account=mingjie $recipient


# 检查发送是否成功
if [ $? -eq 0 ]; then
    echo "Email sent successfully."
else
    echo "Failed to send email."
fi
