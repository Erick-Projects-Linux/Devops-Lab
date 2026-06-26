import subprocess


def check_threshold(usage, threshold, metric):
    if usage >= threshold:
        print(f"WARNING: {metric} usage is above {threshold}%")
    else:
        print(f"{metric} usage is OK")


def get_cpu_usage():
    cpu_data = subprocess.getoutput('top -bn1 | grep "%Cpu"')
    parts = cpu_data.split()

    idle = float(parts[7])
    cpu_usage = int(100 - idle)

    print(cpu_data)
    print(f"CPU usage is {cpu_usage}%")

    check_threshold(cpu_usage, 80, "CPU")


def get_mem_usage():
    mem_data = subprocess.getoutput("free")
    parts = mem_data.split()

    total = float(parts[7])
    used = float(parts[8])

    mem_usage = int((used / total) * 100)

    print(mem_data)
    print(f"Memory usage is {mem_usage}%")

    check_threshold(mem_usage, 80, "Memory")


def get_disk_usage():
    disk_data = subprocess.getoutput("df /workspaces")
    parts = disk_data.split()

    disk_usage = int(parts[11].replace("%", ""))

    print(disk_data)
    print(f"Disk usage is {disk_usage}%")

    check_threshold(disk_usage, 80, "Disk")


get_cpu_usage()
get_mem_usage()
get_disk_usage()