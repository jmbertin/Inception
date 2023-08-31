if [ ! -f "/etc/ftpOK" ]; then
	touch /etc/ftpOK > /dev/null 2>&1

	addgroup ftpgroup > /dev/null 2>&1

	adduser $FTP_USER -shell /bin/false -home /var/www/html/wordpress --disabled-password --gecos "$FTP_USER" > /dev/null 2>&1
	adduser $FTP_USER ftpgroup > /dev/null 2>&1
	echo "$FTP_USER:$FTP_PASSWORD" | chpasswd > /dev/null 2>&1

	chmod -R 1777 /var/www/html/wordpress/ > /dev/null 2>&1

	mv /tmp/proftpd.conf /etc/proftpd/conf.d/proftpd.conf > /dev/null 2>&1
	mv /tmp/tls.conf /etc/proftpd/conf.d/tls.conf > /dev/null 2>&1

fi

echo "FTP Server started (port 21)."
proftpd --nodaemon
