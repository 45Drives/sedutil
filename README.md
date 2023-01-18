![alt tag](https://avatars0.githubusercontent.com/u/13870012?v=3&s=200)

Intel and AMD Ryzen: This SEDutil fork includes support for intel and AMD Ryzen systems with SHA-512 password authentication

Note: This version of SEDutil is not compatible with SHA-1 versions of SEDutil

This software is Copyright 2014-2017 Bright Plaza Inc. <drivetrust@drivetrust.com>

This file is part of sedutil.

sedutil is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

sedutil is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with sedutil.  If not, see <http://www.gnu.org/licenses/>.


sedutil - The Drive Trust Alliance Self Encrypting Drive Utility

This program and it's accompanying Pre-Boot Authorization image allow
you to enable the locking in SED's that comply with the TCG OPAL 2.00
standard, Opalite, Pyrite, and Ruby.   

You must be administrator/root to run the host managment program

In Linux libata.allow_tpm must be set to 1. Either via adding libata.allow_tpm=1 to the kernel flags at boot time 
or changing the contents of /sys/module/libata/parameters/allow_tpm from a "0" to a "1" on a running system.

***** sleep (S3) is not supported.

Orginal source code is available on GitHub at https://github.com/Drive-Trust-Alliance/sedutil 

Linux and Windows executables and Linux PBA bootloader images for this version of SEDutil are available at https://github.com/ChubbyAnt/sedutil/releases

## Notable Differences

Unique to this repo are the following modifications:

* SHA512 password hashing vs SHA1 on original SEDutil
* Compatibile with AMD Ryzen and AMD Ryzen mobile systems
* Fixes issue of missing devices on systems with more than 26 drives attached

## Build Process

To compile your own version of `sedutil` you will need the standard development tools, an internet connection, and ~10 GB of disk space. 

### Automated Process

Included dockerfile will handle any build deps needed.

sedutil-cli will be created in the root of the repo.

Podman is required to build. Docker can be used, just need to update CONTAINER_BINARY varible in build-sedutil.sh script.

```
git clone https://github.com/45drives/sedutil
cd container
bash build-sedutil.sh
```

### Manual Process

Building is supported on Ubuntu 18.04.3 (LTS) x64. Other versions will probably not compile correctly!


### Prerequisites:  

```
sudo apt-get update && sudo apt-get upgrade -y  
  
sudo apt-get install build-essential autoconf pkg-config libc6-dev make g++-multilib m4 libtool ncurses-dev unzip zip git python zlib1g-dev wget bsdmainutils automake curl bc rsync cpio git nasm -y

```

### Automatically Build Everything:  

```
git clone https://github.com/ChubbyAnt/sedutil && cd sedutil && autoreconf --install && ./configure && make all && cd images && ./getresources && ./buildpbaroot && ./buildbios && ./buildUEFI64 && ./buildrescue Rescue32 && ./buildrescue Rescue64 && cd ..
```

### Build Everything Manually Step by Step:  

```
git clone https://github.com/ChubbyAnt/sedutil
cd sedutil
autoreconf --install
./configure
make all
cd images
./getresources
./buildpbaroot
./buildbios
./buildUEFI64
./buildrescue Rescue32
./buildrescue Rescue64
cd ..
```

The various recovery and boot images will be located in the `images` directory.
