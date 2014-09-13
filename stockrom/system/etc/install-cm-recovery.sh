#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 7827456 e93a36ad983b0d9f6acb9a7202cdbb98abba3f1d 5492736 8b0e881a43d5b3c02230669a424faf59bba8af10
fi

if ! applypatch -c EMMC:/dev/block/mmcblk0p6:7827456:e93a36ad983b0d9f6acb9a7202cdbb98abba3f1d; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/mmcblk0p5:5492736:8b0e881a43d5b3c02230669a424faf59bba8af10 EMMC:/dev/block/mmcblk0p6 e93a36ad983b0d9f6acb9a7202cdbb98abba3f1d 7827456 8b0e881a43d5b3c02230669a424faf59bba8af10:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi
