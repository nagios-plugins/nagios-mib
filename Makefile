VERSION = 1.1.0

all:
	smistrip -d ./MIB src-mib/nagios*.mib

test:
	smilint -p ./MIB/NAGIOS-ROOT-MIB ./MIB/NAGIOS-NOTIFY-MIB

install:
	@if [ -d /usr/share/snmp/mibs ]; then \
		cp ./MIB/* /usr/share/snmp/mibs; \
		echo "MIBs copied to /usr/share/snmp/mibs"; \
	elseif [ -d /usr/share/mibs ]; then \
		cp ./MIB/* /usr/share/mibs; \
		echo "MIBs copied to /usr/share/mibs"; \
	elseif [ -d /usr/local/share/snmp/mibs ]; then \
		cp ./MIB/* /usr/local/share/snmp/mibs; \
		echo "MIBs copied to /usr/local/share/snmp/mibs"; \
	elseif [ -d /usr/local/share/mibs ]; then \
		cp ./MIB/* /usr/local/share/mibs; \
		echo "MIBs copied to /usr/local/share/mibs"; \
	elseif [ -d $HOME/.snmp/mibs ]; then \
		cp ./MIB/* $HOME/.snmp/mibs; \
		echo "MIBs copied to $HOME/.snmp/mibs"; \
	fi

clean:
	rm ./MIB/*

tarball:
	tar cvzf nagiosmib-${VERSION}.tar.gz README CHANGES LEGAL LICENSE ./MIB/*MIB
	md5sum nagiosmib-${VERSION}.tar.gz > nagiosmib-${VERSION}.tar.gz.md5sum

