module PACKAGES
    NET = [
        'net-tools',    # arp, hostname
        'bind-utils',   # dig
        'iputils',      # traceroute
        'traceroute',
        'mtr',
        'telnet',
        'tcpdump',
        'nmap',
        'lsof',
        'strace',
        'ltrace'
    ]

    UTIL = [
        'vim',
        'curl',
        'wget',
        'tree',
        'yum-utils',
    ]

    ALL = [
        NET,
        UTIL
    ]
end
