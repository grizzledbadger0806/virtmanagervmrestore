echo "======================================"
echo "🧰 VM Restore from Golden Backup"
echo "======================================"

##Get VM list properly
mapfile -t VMS < <(virsh list --all --name | grep -v "^$")

if [ ${#VMS[@]} -eq 0 ]; then
echo "❌ No VMs found"
return 1
fi

echo ""
echo "📦 Available VMs:"
echo "--------------------------------------"

select VM in "${VMS[@]}"; do
if [[ -n "$VM" ]]; then
echo "✔ Selected VM: $VM"
break
else
echo "❌ Invalid selection"
fi
done

##Paths
BACKUP="/Path/To/Golden/Images/GOLDEN_${VM}.qcow2"
DEST="/Path/To/VM/Directory/${VM}.qcow2"

echo ""
echo "🔍 Restore Plan:"
echo "   From: $BACKUP"
echo "   To:   $DEST"
echo ""

if [[ ! -f "$BACKUP" ]]; then
echo "❌ Backup not found: $BACKUP"
return 1
fi

read -rp "⚠️ Proceed? (yes/no): " CONFIRM
if [[ "$CONFIRM" != "yes" ]]; then
echo "❌ Aborted"
return 1
fi

echo ""
echo "📦 Restoring..."
sudo rsync -ah --info=progress2 "$BACKUP" "$DEST" || {
    echo "❌ Restore failed"
    return 1
}

echo "🔧 Setting ownership..."
sudo chown root:root "$DEST"

echo "🔐 Setting permissions..."
sudo chmod 644 "$DEST"

echo "✅ Restore complete for VM: $VM"