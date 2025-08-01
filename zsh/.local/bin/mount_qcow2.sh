#!/bin/bash

# Paths & devices (change if needed)
EXTERNAL_DRIVE="/dev/sdd1"
EXTERNAL_MOUNT="/mnt/external"
QCOW2_MOUNT="/media/Loli"
NBD_DEVICE="/dev/nbd0"

function mount_external_drive() {
  echo "Mounting external drive $EXTERNAL_DRIVE to $EXTERNAL_MOUNT..."
  sudo mkdir -p $EXTERNAL_MOUNT
  sudo mount $EXTERNAL_DRIVE $EXTERNAL_MOUNT
  echo "External drive mounted! You can access files at $EXTERNAL_MOUNT"
}

function mount_qcow2_image() {
  QCOW2_REL_PATH="$1"
  if [ -z "$QCOW2_REL_PATH" ]; then
    echo "Please provide the relative path to the qcow2 file inside $EXTERNAL_MOUNT!"
    exit 1
  fi

  FULL_QCOW2_PATH="$EXTERNAL_MOUNT/$QCOW2_REL_PATH"


  echo "Connecting qcow2 image $FULL_QCOW2_PATH to $NBD_DEVICE..."
  sudo qemu-nbd --connect=$NBD_DEVICE "$FULL_QCOW2_PATH"

  echo "Partitions on $NBD_DEVICE:"
  sudo fdisk -l $NBD_DEVICE

  PARTITION="${NBD_DEVICE}p1"  # adjust if needed!

  echo "Mounting qcow2 partition $PARTITION to $QCOW2_MOUNT..."
  sudo mkdir -p $QCOW2_MOUNT
  sudo mount $PARTITION $QCOW2_MOUNT

  echo "Done! You can now access qcow2 content at $QCOW2_MOUNT"
}

function unmount_all() {
  echo "Unmounting qcow2 partition from $QCOW2_MOUNT..."
  sudo umount $QCOW2_MOUNT

  echo "Disconnecting $NBD_DEVICE and unloading nbd module..."
  sudo qemu-nbd --disconnect $NBD_DEVICE
 
  echo "Unmounting external drive $EXTERNAL_DRIVE from $EXTERNAL_MOUNT..."
  sudo umount $EXTERNAL_MOUNT

  echo "Cleanup complete, onii-nii! ♡(｡>ω<｡)♡"
}

case "$1" in
  --mount)
    mount_external_drive
    ;;
  --qcow2)
    mount_qcow2_image "$2"
    ;;
  --unmount)
    unmount_all
    ;;
  *)
    echo "Usage:"
    echo "  $0 --mount                 # Mount external drive only"
    echo "  $0 --qcow2 relative/path   # Mount qcow2 image from mounted drive"
    echo "  $0 --unmount               # Unmount everything"
    exit 1
    ;;
esac

