FROM kalilinux/kali-rolling

ENV TZ=Asia/Jarusalem

RUN apt-get -y update; \
    apt-get -y upgrade; \
	apt-get -y dist-upgrade; \
    apt install wget -y; \
	apt-get -y autoremove; \ 
	apt-get clean
    
#RUN apt-get -y install kali-tools-top10 exploitdb man-db dirb nikto wpscan uniscan
RUN apt-get -y install nmap hashcat

# initialize Metasploit databse
# RUN service postgresql start && msfdb init && service postgresql stop

VOLUME /root /var/lib/postgresql
# default LPORT for reverse shell
EXPOSE 4444

WORKDIR /root
CMD ["/bin/bash"]