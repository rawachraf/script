#!/bin/bash
#Version 3
#This script verifies the changelog of the glibc packages in the RPM database

echo "Installed glibc version(s)"

rv=0
for glibc_nvr in $( rpm -q --qf '%{name}-%{version}-%{release}.%{arch}\n' glibc ); do
    glibc_ver=$( echo "$glibc_nvr" | awk -F- '{ print $2 }' )
    glibc_maj=$( echo "$glibc_ver" | awk -F. '{ print $1 }')
    glibc_min=$( echo "$glibc_ver" | awk -F. '{ print $2 }')
    
    echo -n "- $glibc_nvr: "
    if [ "$glibc_maj" -gt 2   -o  \
        \( "$glibc_maj" -eq 2  -a  "$glibc_min" -ge 18 \) ]; then
        # fixed upstream version
        echo 'not vulnerable'
    else
        # all RHEL updates include CVE in rpm %changelog
        if rpm -q --changelog "$glibc_nvr" | grep -q 'CVE-2015-0235'; then
            echo "not vulnerable"
        else
            echo "vulnerable"
            rv=1
        fi
    fi
done

if [ $rv -ne 0 ]; then
    cat <<EOF

This system is vulnerable to CVE-2015-0235. 
Please refer to  for remediation steps
EOF
fi

exit $rv