# What is this?
This is an attempt to create a lightweight and minimal container, via podman, for executing the x86_64 version of the IBM Full System Simulator For The CBE Processor, version 3.1 program. 

AKA...the Cell Broadband Engine (BE) processor simulator.

# Prerequisites
podman

# Steps 
Make a folder named `cellsim-container/`
Inside it, place:

1. The following Containerfile
2. A subfolder named `rpms/` containing:
    - `systemsim-cell-3.1-25.f9.x86_64.rpm`
    - `sysroot_image-3.1-1.noarch.rpm`
    - `tcl-8.5.1-4.fc9.x86_64.rpm`
    - `tk-8.5.1-3.fc9.x86_64.rpm`
    - `blt-2.4-27.fc9.x86_64.rpm`
    - systemsim-cell-3.1-25.f9, sysroot_image
      - https://archive.org/details/ibm-full-system-simulator-for-the-cbe-processor
    - tcl, tk, blt are available via the Fedora 9 archives
      - https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/9/Everything/x86_64/os/Packages/
3. Navigate to the cellsim-container
  - ```zsh 
      $ cd cellsim-container 
    ```

4. Build the x86_64
  - ```zsh 
      $ podman build --platform linux/amd64 -t cellsim-f9-amd64 .
    ```
5. Run
  - ```zsh 
      $ podman run --platform linux/amd64 -it cellsim-f9-amd64
    ```
    - or (if on a Mac/macOS) and want to attempt display
      - ```zsh
          $ podman run --platform linux/amd64 -it \
            -e DISPLAY=$DISPLAY \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            cellsim-f9-amd64 bash 
        ```


